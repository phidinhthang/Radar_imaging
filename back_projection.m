function sbar_3d = back_projection(s11_3d, xpos, ypos, f_range, x3d, y3d, z3d)

sbar_3d = zeros(size(x3d));
c = physconst('LightSpeed');
krange = 2 * 180 * f_range / c;

for x_index = 1:length(xpos)
    for y_index = 1:length(ypos)
        del_x = x3d - xpos(x_index);
        del_y = y3d - ypos(y_index);
        del_z = z3d;
        del_r = sqrt(del_x.^2 + del_y.^2 + del_z.^2);
        
        for f_index = 1:length(f_range)
            u = (cos(2 * pi * f_range(f_index) * (2 * del_r) / c)) + 1i * sin(2 * pi * f_range(f_index) * (2 * del_r / c));
            %u = (cosd(krange(f_index) * del_r * 2) + 1i * sind(krange(f_index) * del_r * 2));
            sbar_3d = sbar_3d + u * s11_3d(x_index, y_index, f_index);
        end
    end
end

end