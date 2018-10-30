function write_xml_obj(fp, obj_filename, position)
fprintf(fp, '<shape type="obj" >\n');
fprintf(fp, '  <string name="filename" value="%s"/>\n',obj_filename);
fprintf(fp, '  <transform name="toWorld" >\n');
fprintf(fp, '    <translate x="%.10f" y="%.10f" z="%.10f"/>\n',position(1),position(2),position(3));
fprintf(fp, '  </transform >\n');
fprintf(fp, '  <bsdf type="diffuse" >\n');
fprintf(fp, '    <srgb name="diffuseReflectance" value="#6d7185"/>\n');
fprintf(fp, '    <float name="intIOR" value="1.9"/>\n');
fprintf(fp, '  </bsdf >\n');
fprintf(fp, '</shape >\n');

end
