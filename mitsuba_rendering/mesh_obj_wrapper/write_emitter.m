function write_emitter(fp)

fprintf(fp, '<emitter type="envmap" id="Area_002-light">\n');
fprintf(fp, '  <string name="filename" value="envmap.exr"/>\n');
fprintf(fp, '  <transform name="toWorld">\n');
fprintf(fp, '    <rotate y="1" angle="-180"/>\n');
fprintf(fp, '    <matrix value="-0.224951 -0.000001 -0.974370 0.000000 -0.974370 0.000000 0.224951 0.000000 0.000000 1.000000 -0.000001 8.870000 0.000000 0.000000 0.000000 1.000000 "/>\n');
fprintf(fp, '  </transform>\n');
fprintf(fp, '  <float name="scale" value="3"/>\n');
fprintf(fp, '</emitter>\n');

end
