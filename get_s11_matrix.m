clc
clear

% c = physconst('LightSpeed');
% lambda_10Ghz = c / (4e9);
num_points = 501;
% f_start = 1;
% f_stop = 6;
% f_range = linspace(f_start, f_stop, num_points);
% k_range = 2 * 180 * 1e9 * f_range / c;
% bw = (f_stop - f_start) * 1e9;

limit = 5;
scale_x = 1;
scale_y = 1;
x_range = limit * scale_x;
y_range = limit * scale_y;

ntx_arr = -x_range:scale_x:x_range;
% ntx_arr = [0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4];
% ntx_idx = ['0' 'pi-div4', 'pi-div2', '3pi-div4', 'pi', '5pi-div4', '3pi-div2', '7pi-div4'];
nrx_arr = -y_range:scale_y:y_range;
s11_3d = zeros(num_points, length(ntx_arr), length(nrx_arr));

for ntx_index = 1:length(ntx_arr)
    for nrx_index = 1:length(nrx_arr)
        ntx = ntx_arr(ntx_index);
        nrx = nrx_arr(nrx_index);
        data = readmatrix(['./s21_results/cscan/week7/vivaldi2_bw_3_10_rect_with_hole2_lambda_div1_dis_600mm_3GHz_10GHz/s21_complex_ny_', ...
            num2str(ntx), '_nz_', num2str(nrx), '.csv']);
        s11 = data(:, 2) + 1i * data(:, 3);
        s11_3d(:, ntx_index, nrx_index) = s11;
    end
end

save('s11_3d_sar_matrix', 's11_3d');