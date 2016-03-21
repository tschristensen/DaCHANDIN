clear;clc;close;

data_files = dir('C1transient_790_2*.dat');

numfiles  = size(data_files,1);

for k = 1:numfiles
  all_data{k} = importdata(data_files(k).name);
  data = all_data{1,k};
  hold on
  plot(data(:,1),data(:,2))
  
  
end
legend('boxon')
V0 = 8; % Should this be calculated
tau = 1/exp(1) * V0