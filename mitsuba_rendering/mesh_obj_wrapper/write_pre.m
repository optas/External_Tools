function write_pre(fp)
% writes beginning of the .xml file


fprintf(fp, '<?xml version="1.0" encoding="utf-8"?>\n');

fprintf(fp, '<scene version="0.5.0">\n');
fprintf(fp, '	<!--Setup scene integrator -->\n');
fprintf(fp, '	<integrator type="path">\n');
fprintf(fp, '		<!-- Path trace with a max. path length of 5 -->\n');
fprintf(fp, '		<integer name="maxDepth" value="5"/>\n');
fprintf(fp, '	</integrator>\n');

end
