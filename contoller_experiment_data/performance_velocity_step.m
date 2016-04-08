clc;clear;close all;
fig_x = 400*2; fig_y = 225*2;

load('PI_single_200rads_ex.mat');
time = PI_single_200rads_ex.X.Data;
w = PI_single_200rads_ex.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 200)
l = zeros([1 length(w)]);
l_low = l + 200*0.95;
l_high = l + 200*1.05;

figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller - 200 [$\frac{Rad}{S}$]','interpreter','LaTex')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary','location','southeast')
xlim([0,0.25])

load('../datasimul/PI_single_200rad.mat');
time = PI_single_200rad.time;
w = PI_single_200rad.signals.values;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 200)
l = zeros([1 length(w)]);
l_low = l + 200*0.95;
l_high = l + 200*1.05;

figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller, Simulated - 200 [$\frac{Rad}{S}$]','interpreter','LaTex')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary','location','southeast')
xlim([0,0.25])

load('PI_single_400rads_sat_ex.mat');
time = PI_single_400rads_ex.X.Data;
w = PI_single_400rads_ex.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 400)
l = zeros([1 length(w)]);
l_low = l + 400*0.95;
l_high = l + 400*1.05;

figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller - 400 [$\frac{Rad}{S}$]','interpreter','LaTex')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary','location','southeast')
xlim([0,0.25])