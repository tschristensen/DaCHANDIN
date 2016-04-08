clc;clear;close all;
load('PI_single_125rads_extra_inertia_ex.mat');

time = PI_single_125rads_extra_inertia.X.Data;
w = PI_single_125rads_extra_inertia.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 125)
l = zeros([1 length(w)]);
l_low = l + 125*0.95;
l_high = l + 125*1.05;

fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller - Inertia, 125 [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
xlim([0,1.5])

load('../datasimul/PI_inertia_125rad.mat');

time = PI_inertia_125rad.time;
w = PI_inertia_125rad.signals.values;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 125)
l = zeros([1 length(w)]);
l_low = l + 125*0.95;
l_high = l + 125*1.05;

fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller, Simulated - Inertia, 125 [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
xlim([0,1.5])