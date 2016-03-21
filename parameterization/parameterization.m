clc;clear;close all;

ra_data_enc_motor = csvread('ra_data_enc_motor.csv',1,0);

V = ra_data_enc_motor(:,1);
I = ra_data_enc_motor(:,2);

f = fittype('a*x+b');

fit2 = fitlm(V,I)
%[fit1,gof,fitinfo] = fit(V,I,f,'StartPoint',[1 1]);

Ra = sum(V)/sum(I)

fig_x = 400*2; fig_y = 225*2;
fitted = fit2.Fitted
figure('Position',[100,100,fig_x,fig_y])
plot(V,fitted,'r-',V,I,'o')
legend('Data Points', 'Fitted Line', 'Location', 'northwest')
title('Current as a Function of Voltage')
xlabel('Voltage [V]')
ylabel('Current [I]')

