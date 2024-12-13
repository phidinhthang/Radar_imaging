function costFunc = func_Optimize(param_X)

runPyCmd = ['ipy64 HFSS_Main.py ',num2str(param_X)];
[~,msg] = system(runPyCmd);

SData = readtable('./s21_results/week8/vivaldi_taper_s11.csv');
% figure(2)
% plot(SData{:,1},SData{:,2})

S11 = SData{:,2};
costFunc = max(S11(1:401)); % 51 to 251 is from 8.5 GHz to 10.5 GHz

T = [param_X,costFunc]
dlmwrite('Sim_History.csv',T,'delimiter',',','-append') %Saving a record of all results

end
