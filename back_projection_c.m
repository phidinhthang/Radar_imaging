function sbar_3d = back_projection_c(s11_3d, degs, ypos, f_range, x3d, y3d, z3d)

sbar_3d = zeros(size(x3d));
c = physconst('LightSpeed');
% krange = 2 * 180 * f_range / c;

for deg_index = 1:length(degs)
    if deg_index == 1 || deg_index == 2 || deg_index == 8 
    for y_index = 1:length(ypos)
        zpos = 0.1 - 0.1*cos(degs(deg_index));
        xpos = 0.1*sin(degs(deg_index));
        del_x = x3d - xpos;
        del_y = y3d - ypos(y_index);
        del_z = z3d - zpos;
        del_r = sqrt(del_x.^2 + del_y.^2 + del_z.^2);
        
        for f_index = 1:length(f_range)
            u = (cos(2 * pi * f_range(f_index) * (2 * del_r) / c) + 1i * sin(2 * pi * f_range(f_index) * (2 * del_r / c)));
            sbar_3d = sbar_3d + u * s11_3d(deg_index, y_index, f_index);
        end
    end
    end
end

end