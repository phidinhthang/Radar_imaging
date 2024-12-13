clc
clear

demo = 4;

if (demo == 0)
    num_points = 401;
    folder_name = 'vivaldi6_bw_3_10_rect_with_hole2_lambda_div1_dis_600mm_3GHz_10GHz/';
elseif (demo == 1)
    num_points = 501;
    folder_name = 'vivaldi2_bw_3_10_letter_u_lambda_div1_dis_600mm_3GHz_10GHz/';
elseif (demo == 2)
    num_points = 501;
    folder_name = 'vivaldi2_bw_3_10_letter_f_lambda_div1_dis_600mm_3GHz_10GHz/';
elseif (demo == 3)
    num_points = 501;
    folder_name = 'vivaldi6_bw_3_10_grenade_in_pvc_lambda_div06_dis_200mm_3GHz_10GHz/';
elseif (demo == 4)
    num_points = 501;
    folder_name = 'vivaldi_bw_3_10_simplebomb_lambda_div05_dis_300mm_3GHz_10GHz/';
elseif (demo == 5)
    num_points = 501;
    folder_name = 'horn0_bw_3_4_rect_with_hole2_lambda_div1_dis_600mm_3GHz_4GHz/';
elseif (demo == 6)
    num_points = 501;
    folder_name = 'horn0_bw_3_4_letter_u_lambda_div1_dis_600mm_3GHz_4GHz/';
elseif (demo == 7)
    num_points = 501;
    folder_name = 'horn_letter_f_lambda_div1_dis_600mm/';
elseif (demo == 8)
    num_points = 501;
    folder_name = 'vivaldi_bw_3_10_spoon_in_sand_lambda_div05_dis_300mm_3GHz_10GHz_test2/';
end

limit = 5;
scale_x = 1;
scale_y = 1;
x_range = limit * scale_x;
y_range = limit * scale_y;

ntx_arr = -x_range:scale_x:x_range;
nrx_arr = -y_range:scale_y:y_range;
s11_3d = zeros(num_points, length(ntx_arr), length(nrx_arr));

for ntx_index = 1:length(ntx_arr)
    for nrx_index = 1:length(nrx_arr)
        ntx = ntx_arr(ntx_index);
        nrx = nrx_arr(nrx_index);
        data = readmatrix(['./demo/', folder_name, '/s21_complex_ny_', ...
            num2str(ntx), '_nz_', num2str(nrx), '.csv']);
        s11 = data(:, 2) + 1i * data(:, 3);
        s11_3d(:, ntx_index, nrx_index) = s11;
    end
end

save('s11_3d_sar_matrix', 's11_3d');