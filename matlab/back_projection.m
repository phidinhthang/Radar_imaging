function sbar_3d = back_projection(s11_3d, xpos, ypos, f_range, x3d, y3d, z3d)

sbar_3d = zeros(size(x3d));
c = physconst('LightSpeed');

for x_index = 1:length(xpos)
    for y_index = 1:length(ypos)
        del_x = x3d - xpos(x_index);
        del_y = y3d - ypos(y_index);
        del_z = z3d;
        del_r = sqrt(del_x.^2 + del_y.^2 + del_z.^2);

        estimated_time = 2 * del_r / c;
        
        for f_index = 1:length(f_range)
            omega = 2 * pi * f_range(f_index);
            real_part = cos(omega * estimated_time);
            image_part = 1i * sin(omega * estimated_time);
            u = real_part + image_part;
       
            sbar_3d = sbar_3d + u * s11_3d(x_index, y_index, f_index);
        end
    end
end

end