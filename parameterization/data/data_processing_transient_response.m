clear;clc;close;

data_files = dir('C1transient_res32*.dat');
%data_files = dir('C1transient_res32small00003.dat');

numfiles  = size(data_files,1);

%Layout
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
axis([-2e-5 4e-4 -0.5 8.5])
title('Transient Response of Stalled Motor')
xlabel('Time [s]') % x-axis label
ylabel('Voltage [V]') % y-axis label

for k = 1:numfiles
  all_data{k} = importdata(data_files(k).name);
  data = all_data{1,k};
  hold on
  plot(data(:,1),data(:,2))
end

sum_mean_V0 = 0;
%Find mean values before the step
for k = 1:numfiles
    data = all_data{1,k};
    amp_step = find(data(:,1)<-1e-6,1);  %-1e-6 is a time before the step
    mean_V0 = mean(data(1:amp_step,2));
    sum_mean_V0 = sum_mean_V0 + mean_V0;
end

all_data_mean_V0 = sum_mean_V0/numfiles

V0 = all_data_mean_V0;
tau = 1/exp(1) * V0

hline = refline([0 V0]);
hline.Color = 'r';
hline = refline([0 tau]);
hline.Color = 'r';

%Find tau in each dataset
sum_t_tau = 0;
for k = 1:numfiles
    data = all_data{1,k};
    amp_tau = find(data(:,2)<tau,1);
    t_tau = data(amp_tau,1);
    sum_t_tau = sum_t_tau + t_tau;
end

mean_t_tau = sum_t_tau/numfiles

% tau = La/(Ra + Re) 
%Re = Extra Resistor = ??OHMs
%Re = 122.08;
%Re = 62;
%Re = 32.472;
%Re = 518.46;
Re = 32.97;
%Ra found to be ?? SEE THOMAS' RESULTS!!
Ra = 3.4;
%Isolating La
La = mean_t_tau*(Ra+Re)
real_La = 2.5e-3;
real_Ra = 2.96;
real_tau = real_La/(real_Ra+Re)
diff = (La-real_La)/real_La *100