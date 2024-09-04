clc
clear

load('s11_3d_sar_matrix.mat')
%s11_3d = s11_3d(1:251, :, :);
s11_3d_rot = permute(s11_3d, [2 3 1]);

c = physconst('LightSpeed');
lambda_3halfGhz = c / 3.5e9;
num_points = 501;
f_start = 3e9;
f_stop = 10e9;
f_range = linspace(f_start, f_stop, num_points);

limit_x = 5;
limit_y = 5;
scale_x = 1;
scale_y = 1;
x_range = limit_x * scale_x;
y_range = limit_y * scale_y;
step = lambda_3halfGhz / 1;

xpos = (-x_range * step):(scale_x * step):(x_range * step);
ypos = (-y_range * step):(scale_y * step):(y_range * step);
nx = length(xpos); ny = length(ypos);

xrange = 1 * xpos;
yrange = 1 * ypos;

zrange = 0.605;

[ximg, yimg, zimg] = ndgrid(xrange, yrange, zrange);

sbar_3d = back_projection(s11_3d_rot, xpos, ypos, f_range, ximg, yimg, zimg);

pwr_max = max(20 * log10(abs(sbar_3d(:))));
for z_index = 1:length(zrange)
    [x2d, y2d] = ndgrid(xrange, yrange);
    sbar_2d_dB = 20 * log10(abs(sbar_3d(:, :, z_index)));
    sbar_2d_dB_norm = sbar_2d_dB - pwr_max;

    figure(2)
    clf
    surf(x2d, y2d, squeeze(sbar_2d_dB_norm))
    xlabel('X')
    ylabel('Y')
    set(gca, 'FontSize', 20)
    shading interp
    view(0, 90); axis equal; axis tight;
    colormap('jet');
    colorbar
    set(gca, 'clim', [-8 -4]);
    w = waitforbuttonpress;
end
