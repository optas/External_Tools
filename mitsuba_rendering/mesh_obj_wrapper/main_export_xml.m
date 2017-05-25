clear all
curr_dir = cd;

% INPUT: change at your own will. If multiple meshes are given, it will apply the work on all of them.
% mesh directory - input
mesh_dir = fullfile(curr_dir, 'meshes');
% rendering parameters directory - input
params_dir = fullfile(curr_dir, 'params');

% scene directory - output
scenedir = fullfile(curr_dir, 'scenes');
mkdir(scenedir)  % XML and EXR files are saved in this folder

% image directory - output
imagedir = fullfile(curr_dir, 'images');
mkdir(imagedir)  % Saves here the PNG resulting by EXR

% run the rendering parameters file
paramsfile = fullfile(params_dir, 'myparams.m');
run (paramsfile);

% also write a script to run mitsuba *and* the 
% exr-to-png converter for each scene - the scipt's name is render_all.sh
scriptfile = 'render_all.sh';
fp_script = fopen(scriptfile,'w');
% write into script: change directory
fprintf(fp_script,'cd %s\n', imagedir);

% sphere size
radius = 0.01;

% also needed in the same directory as the scene: 
% environment map for lighting, and the background "folded plane"
copyfile('shared/envmap.exr', scenedir);
copyfile('shared/matpreview.serialized', scenedir);

% rotate around x axis by 90 degrees - this will make the z-axis of the
% mesh point UP
Rx = [1, 0, 0; 0, 0, -1; 0, 1, 0];  % If meshes are reasonable wrt. x-y-z coordinates make Rx the identity!



% append any rotation around the (new) z, according to the params file
R = [cos(zrot), -sin(zrot), 0; sin(zrot), cos(zrot), 0; 0, 0, 1];
R = R*Rx;

% read ALL obj files from mesh directory 
suffix = '.obj';
list = dir(fullfile(mesh_dir,['*',suffix]));
num_files = length(list);



% For every obj loaded, create a scene with the above define params. 
% It also creates a command appropritate for rendering and conversion of the result with Mitsuba and its sub-componennts (mts-util). 
% These comandsa are saved in the 'render_all.sh'.
% The final .png will be saved in "image-dir".

for ii = 1 : 1 : num_files
    
    fprintf('Generating %d / %d\n',ii, length(list));
    % the *.obj input mesh file
    name = list(ii).name;
    % full path
    meshfile_in = fullfile(mesh_dir,name);
    assert(exist(meshfile_in,'file')>0);
    
    % isolate the part of the name up to the first dot
    dot_locs = strfind(name,'.');    
    name_no_suffix = name(1:dot_locs(1)-1);
    
    % need to save the rotated/shifted mesh into the same directory
    % as the scene.
    meshfile_out_no_pre = sprintf('%s.obj',name_no_suffix);
    meshfile_out = fullfile(scenedir,meshfile_out_no_pre);
    
    % transform input mesh 
    % read mesh
    [V,F] = readOBJ(meshfile_in);    
    % center at (0,0,0) and rotate to make the z axis point up
    V =  bsxfun(@minus, V, mean(V))*R';
    % need to set minimum z at [0,0,0] so that you can place
    % the background "plane" to touch the mesh at its lowest point
    minz =  min(V(:,3));
    % write modified mesh into scene directory
    writeOBJ(meshfile_out, V,F);
    
    % write scene 
    scenefile = fullfile(scenedir,sprintf('%s.xml',name_no_suffix));
    fp = fopen(scenefile,'w');
    % write preamble
    write_pre(fp);
    % write camera and resolution etc.
    write_sensor(fp,sensor);
    % write the lighting (based on environment map)
    write_emitter(fp);
    % write the background "folded plane", translated at the z-axis 
    % so that it touches the mesh 
    write_xml_fold(fp, ytrans, minz);
    % write the mesh, with no additional translation
    write_xml_obj(fp,meshfile_out_no_pre,[0,0,0]);
    % write last bits of file
    write_post(fp);
    fclose(fp);

    % write into the script so that the .exr produced by Mitsuba
    % gets converted into a .png
    % (expected) output of mitsuba
    exrfile = fullfile(scenedir,sprintf('%s.exr',name_no_suffix));
    fprintf(fp_script,'mitsuba %s\n',scenefile);
    % target output of mtsutil
    pngfile = fullfile(imagedir,sprintf('%s.png',name_no_suffix));
    fprintf(fp_script,'mtsutil tonemap -o %s %s\n',pngfile, exrfile);
    
end

% write into script: change back to original directory
fprintf(fp_script,'cd %s\n',curr_dir);
fclose(fp_script);
