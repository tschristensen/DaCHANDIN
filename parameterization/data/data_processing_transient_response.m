clear;clc;close;

data_files = dir('C1transient_790_2*.dat');

numfiles  = size(data_files,1);

%Layout
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
axis([-0.0025 0.05 0 8.5])

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
    amp_step = find(data(:,1)<-0.5*10^(-3),1);  %-0.5*10^-3 is a time before the step
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
%Re = Extra Resistor = 62.128 OHMs
Re = 62.128;
%Ra found to be ?? SEE THOMAS' RESULTS!!
Ra = 3.4;
%Isolating La
La = mean_t_tau*(Ra+Re)