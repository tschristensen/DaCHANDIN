clc;clear;close all;
%%Load Step 
load('PI_125rads_load_step_ex.mat');
time = PI_dualmotor_125rads_load_step_.X.Data;
w = PI_dualmotor_125rads_load_step_.Y.Data;

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
title('Load Step Response of PI Controller - 125 [$\frac{Rad}{S}$], 0.4[A]','interpreter','LaTex')
legend('Load Step Response', '5% Settling Time Boundary')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
xlim([0,1.5])

load('PI_125rads_load_step_unstable_ex.mat');

time = PI_dualmotor_125rads_load_step_.X.Data;
w = PI_dualmotor_125rads_load_step_.Y.Data;

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
title('Step Response of PI Controller - Inertia, 125 [$\frac{Rad}{S}$], 0.5[A]','interpreter','LaTex')
legend('Step Response', '5% Settling Time Boundary')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
xlim([0,1.5])

load('../datasimul/PI_load125.mat');

time = PI_load125.time(118:end)-PI_load125.time(118);
w = PI_load125.signals.values(118:end);

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
title('Load Step Response of PI Controller, Simulated - 125 [$\frac{Rad}{S}$], ','interpreter','LaTex')
legend('Load Step Response', '5% Settling Time Boundary')
xlabel('Time [$S$]','interpreter','LaTex')
ylabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
xlim([0,1.5])
