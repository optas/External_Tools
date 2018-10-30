function write_xml_fold(fp,ytrans,ztrans)
scale = 10;

fprintf(fp, '	<texture type="checkerboard" id="__planetex">\n');
fprintf(fp, '		<rgb name="color0" value="0.9"/>\n');
fprintf(fp, '		<rgb name="color1" value="0.9"/>\n');
fprintf(fp, '		<float name="uscale" value="8.0"/>\n');
fprintf(fp, '		<float name="vscale" value="8.0"/>\n');
fprintf(fp, '		<float name="uoffset" value="0.0"/>\n');
fprintf(fp, '		<float name="voffset" value="0.0"/>\n');
fprintf(fp, '	</texture>\n');

fprintf(fp, '	<bsdf type="diffuse" id="__planemat">\n');
fprintf(fp, '		<ref name="reflectance" id="__planetex"/>\n');
fprintf(fp, '	</bsdf>\n');


fprintf(fp, '	<shape type="serialized" id="Plane-mesh_0">\n');
fprintf(fp, '		<string name="filename" value="matpreview.serialized"/>\n');
fprintf(fp, '		<integer name="shapeIndex" value="0"/>\n');
fprintf(fp, '		<transform name="toWorld">\n');
fprintf(fp, '			<scale x="%.4f" y="%.4f" z="%.4f"/>\n',scale,scale,scale);
fprintf(fp, '			<translate y="%.10f" z="%.10f" />\n',scale*ytrans,ztrans);
fprintf(fp, '		</transform>\n');
fprintf(fp, '		<ref name="bsdf" id="__planemat"/>\n');
fprintf(fp, '	</shape>\n');
end
