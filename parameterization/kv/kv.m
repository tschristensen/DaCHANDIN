clc;clear;close all;

%data = csvread('kviscous.csv',1,0);
data = csvread('kviscous_velocity.csv',1,0);

Km = 0.036064542444157;
Ra = 3.714849119427301;

v = data(:,1);
i = data(:,2);
w = data(:,3);

Te = Km*i;

t = [0:127:6000]';
Tv_actual = 2.6e-6*(t*(2*pi/60))+0.0042;

fit1 = fitlm(v(20:end,1),Te(20:end,1))

fig_x = 400*2; fig_y = 225*2;
fitted = fit1.Fitted;
figure('Position',[100,100,fig_x,fig_y])
plot(w*(2*pi/60),Tv_actual,'g',w(20:end)*(2*pi/60), fitted,'-r',w*(2*pi/60),Te,'bo')
grid on
legend('Coloumb Friction, actual','Fitted Line','Data Points', 'Location', 'northwest')
title('Torque as a Function of Angular Velocity')
xlabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
ylabel('Torque [$Nm$]','interpreter','LaTex')

Tc = fit1.Coefficients.Estimate(1);

Kv = (Km*i-Tc)./(w*(2*pi/60));

figure('Position',[100,100,fig_x,fig_y])
plot(w*(2*pi/60),Kv,'-o')
grid on
title('Viscous Damping Factor as a Function of Angular Velocity')
xlabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
ylabel('Viscous Damping Factor [$Nm\cdot\frac{S}{Rad}$]','interpreter','LaTex')

Kv = sum(Kv(15:end))/length(Kv(15:end))