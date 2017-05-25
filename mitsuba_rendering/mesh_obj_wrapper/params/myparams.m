sensor.focusDistance = 2.3173;    % Keep the same all the time.
sensor.target = [0.0, 0, 0];      % Where is the camera looking: 99% keep it on (0,0,0).
sensor.origin = [0, -1.3, 0.15];  % Where is the camera placed: first is x, second is y (how far away is the camera), last is the z-axis, how "up".
sensor.up = [0., 0., 1.];         % No need to change.
sensor.height = 480;              % For single image height/width at 480 is good. More imgages => increase.
sensor.width = 480;
sensor.samples = 1000;              % More samples, less noise. 1500 is alrady very hight. For experimenting: set to 50.


zrot = -60*pi/180;                % Affects the view-point: rotating the object in place around the up-axis.

ytrans = 0.5;                     % This affects the 'envelope' or 'folded_plane' as was baptized by Olga.