function write_sensor(fp,sensor)


fprintf(fp, '<!-- Instantiate a perspective camera with 45 degrees field of view -->\n');
fprintf(fp, '<sensor type="perspective">\n');
fprintf(fp, '  <float name="focusDistance" value="%.10f"/>\n',sensor.focusDistance);
fprintf(fp, '  <float name="fov" value="45"/>\n');
fprintf(fp, '  <string name="fovAxis" value="x"/>\n');
fprintf(fp, '  <transform name="toWorld">\n');

fprintf(fp, '    <lookat target="%.10f, %.10f, %.10f" origin="%.10f, %.10f, %.10f" up="%.10f, %.10f, %.10f"/>\n',...
    sensor.target(1), sensor.target(2), sensor.target(3),...
    sensor.origin(1), sensor.origin(2), sensor.origin(3),...
    sensor.up(1), sensor.up(2), sensor.up(3));
fprintf(fp, '      </transform>\n');

fprintf(fp, '  <sampler type="ldsampler">\n');
fprintf(fp, '    <integer name="sampleCount" value="%d"/>\n',sensor.samples);
fprintf(fp, '  </sampler>\n');

fprintf(fp, '  <film type="hdrfilm">\n');
fprintf(fp, '    <integer name="height" value="%i"/>\n',sensor.height);
fprintf(fp, '    <integer name="width" value="%i"/>\n',sensor.width);

fprintf(fp, '    <rfilter type="gaussian"/>\n');
fprintf(fp, '  </film>\n');
fprintf(fp, '</sensor>\n');
end
