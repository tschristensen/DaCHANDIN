clc;clear;close all;
fig_x = 400*2; fig_y = 225*2;
%%Velocity Step with inertia
load('PID_dual_125rads_load_ex.mat');
time = PID_dual_125rads_load_ex.X.Data;
w = PID_dual_125rads_load_ex.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 125)
l = zeros([1 length(w)]);
l_low = l + 125*0.95;
l_high = l + 125*1.05;

fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
plot(time,w)
%plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PID Controller - Load 0.4[$A$], 125 [$\frac{Rad}{S}$]','interpreter','LaTex')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary')

load('PID_single_125rads_ex.mat');
time = PID_single_125rads_ex.X.Data;
w = PID_single_125rads_ex.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 125)
l = zeros([1 length(w)]);
l_low = l + 125*0.95;
l_high = l + 125*1.05;

fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
%plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
plot(time,w)
grid on
title('Step Response of PID Controller - 125 [$\frac{Rad}{S}$]','interpreter','LaTex')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 125)
l = zeros([1 length(w)]);
l_low = l + 125*0.95;
l_high = l + 125*1.05;
% 
% load('PID_single_125rads_inertia_ex.mat');
% time = PID_single_125rads_inertia_ex.X.Data;
% w = PID_single_125rads_inertia_ex.Y.Data;
% 
% fig_x = 400*2; fig_y = 225*2;
% figure('Position',[100,100,fig_x,fig_y])
% plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
% grid on
% title('Step Response of PID Controller - Inertia, 125 [$\frac{Rad}{S}$]','interpreter','LaTex')
% xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')