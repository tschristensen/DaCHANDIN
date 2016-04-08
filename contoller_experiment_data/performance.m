clc;clear;close all;

%%Velocity Step with inertia
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

load('PI_single_250rads_ex.mat');
time = PI_single_250rads_ex.X.Data;
w = PI_single_250rads_ex.Y.Data;

index = 1501;
avg = sum(w(index:end))/(length(w)-index)
S = stepinfo(w,time, 250)
l = zeros([1 length(w)]);
l_low = l + 250*0.95;
l_high = l + 250*1.05;

figure('Position',[100,100,fig_x,fig_y])
plot(time,w,time,l_low,'-.r',time,l_high,'-.r')
grid on
title('Step Response of PI Controller - 250 [$\frac{Rad}{S}$]','interpreter','LaTex')
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