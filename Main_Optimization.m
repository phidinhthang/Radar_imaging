
clc
clear

% L CircleR rate
param_X = [45, 2.5, 160]; % Initial values
LB_X = [40, 2.2, 140]; % Lower bounds
UB_X = [50, 2.8, 180]; % Upper bounds

%% Seed simulation for reference
% runPyCmd = ['ipy64 HFSS_Main.py ',num2str(param_X)];
% [~,msg] = system(runPyCmd);
% 
% SData_original = readtable('./s21_results/week8/vivaldi_tapered_S11.csv');
% 
% figure(1)
% plot(SData_original{:,1},SData_original{:,2},'r--');
% xlabel('Freq (GHz)'); ylabel('S11 (dB)'); grid on; hold on;

%% Run optimization routine

tic
options = optimset('PlotFcns',@optimplotfval);options.MaxFunctionEvaluations = 10;
optim_X = fminsearchbnd(@(param_X)func_Optimize(param_X),param_X,LB_X,UB_X,options);
time = toc;

%% Optimized results

runPyCmd = ['ipy64 HFSS_Main.py ',num2str(optim_X)];
[~,msg] = system(runPyCmd);

SData_final = readtable('./s21_results/week8/vivaldi_taper_s11.csv');

figure(1)
plot(SData_final{:,1},SData_final{:,2},'k');
xlabel('Freq (GHz)'); ylabel('S11 (dB)'); grid on; hold on;

legend('Original', 'Optimized')
title(['Simulation time: ',num2str(time/60),' minutes'])