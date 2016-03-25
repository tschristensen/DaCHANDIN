clc;clear;close all;

ra_data_enc_motor = csvread('ra_data_motor_01.csv',1,0);

V = ra_data_enc_motor(:,1);
I = ra_data_enc_motor(:,2);


fit1 = fitlm(V(1:40),I(1:40),'y~x1-1')
%fit1 = fitlm(V(1:40),I(1:40))
%[fit1,gof,fitinfo] = fit(V,I,f,'StartPoint',[1 1]);

%Ra = sum(V)/sum(I)

fig_x = 400*2; fig_y = 225*2;
fitted = fit1.Fitted;
figure('Position',[100,100,fig_x,fig_y])
plot(V(1:40),fitted,'r-',V,I,'o')
legend('Fitted Line','Data Points', 'Location', 'northwest')
title('Current as a Function of Voltage')
xlabel('Voltage [V]')
ylabel('Current [I]')
axis([0,6,-0.2,2])

Ra = 1/fit1.Coefficients.Estimate(1)
%Ra = 1/fit1.Coefficients.Estimate(2)