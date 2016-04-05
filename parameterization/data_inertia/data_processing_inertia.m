clear;clc;close;
!synclient HorizTwoFingerScroll=0
 
vass = 7;           % Changed between the experiments
kfm = 2.611e-6;      % Should be the found value 
km =0.036;         % Should be the found value 
Ra = 3.647;          % Should be the found value

ia_T = (kfm * Ra + km^2 * exp(-1))/(kfm * Ra + km^2) * vass/Ra;


% Load files
data_files = dir('C1transient_I_7v*.dat');
%data_files = dir('C1transient_I_1v_00004.dat');


numfiles  = size(data_files,1);

%Layout Docu
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
axis([-0.005 0.08 -0.05 1.5])
title('Transient Step Response of Motor ')
xlabel('Time [s]') % x-axis label
ylabel('Current [I]') % y-axis label

for k = 1:numfiles
  all_data{k} = importdata(data_files(k).name);
  data = all_data{1,k};
  hold on
  plot(data(:,1),data(:,2))
end

%Plot Ia(T) level
hline = refline([0 ia_T]);
hline.Color = 'r';
hline.LineStyle = '--';

%Find Ia(T) level in time and plot it

sum_t_ia_T = 0;
sum_val_ia_T = 0;
for k = 1:numfiles
    data = all_data{1,k};
    max_i = max(data(:,2));                 %Find max value of the current
    max_n = find(data(:,2) == max_i);       %Find element number in the vector corresponding to the max value
    
    vector = data(max_n(1):end,2);
    amp_ia_T = find(data(max_n(1):end,2)<ia_T,1);
    val_ia_T = data((max_n(1)+amp_ia_T),2);
    t_ia_T = data(max_n(1)+amp_ia_T,1);

    sum_val_ia_T = sum_val_ia_T + val_ia_T;
    sum_t_ia_T = sum_t_ia_T + t_ia_T;
end

mean_t_ia_T = sum_t_ia_T/numfiles;
mean_val_ia_T = sum_val_ia_T/numfiles
vline = line([mean_t_ia_T mean_t_ia_T], [-1 10]);
vline.Color = 'r';
vline.LineStyle = '--';


T= mean_t_ia_T;
jm = ((kfm + km^2)/Ra)*T

%Calculated by running this script on the data
jm(1) = 7.9668e-06;
jm(2) = 6.3002e-06;
jm(3) = 6.1315e-06;
jm(4) = 5.7624e-06;
jm(5) = 5.8636e-06;
jm(6) = 5.8233e-06;
jm(7) = 5.7379e-06;
jm(8) = 5.7040e-06;
jm(9) = 5.6217e-06;
jm(10) = 5.7230e-06;


mean_jm_all_voltages = mean(jm)

real_jm = 4.17e-6;
diff = (mean_jm_all_voltages-real_jm)/real_jm *100

