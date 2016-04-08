clc;clear;close all;

data_low = csvread('kviscous_velocity_lowV.csv',1,0);
data = csvread('kviscous_velocity.csv',1,0);

Km = 0.036064542444157;
Ra = 3.714849119427301;

v_low = data_low(:,1);
i_low = data_low(:,2);
w_low = data_low(:,3);


v = vertcat(v_low,data(4:end,1));
i = vertcat(i_low,data(4:end,2));
w = vertcat(w_low,data(4:end,3));

Te = Km*i;

Tv_actual = 2.6e-6*(w*(2*pi/60))+0.0042;

fit1 = fitlm(v(48:end,1),Te(48:end,1))

fig_x = 400*2; fig_y = 225*2;
fitted = fit1.Fitted;
figure('Position',[100,100,fig_x,fig_y])
plot(w*(2*pi/60),Tv_actual,'g',w(48:end)*(2*pi/60), fitted,'-r',w*(2*pi/60),Te,'-bo')
grid on
legend('T_c+T_v, actual','Fitted Line','Data Points', 'Location', 'northwest','interpreter','LaTex')
title('Torque as a Function of Angular Velocity')
xlabel('Angular Velocity [$\frac{Rad}{S}$]','interpreter','LaTex')
ylabel('Torque [$Nm$]','interpreter','LaTex')

figure('Position',[100,100,fig_x,fig_y])
plot(w(1:40)*(2*pi/60),Te(1:40),'-bo')
grid on
legend('Total Friction', 'Location', 'northwest')
title('Torque as a Function of Angular Velocity, Low $\omega_r$','interpreter','LaTex')
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

Kv = sum(Kv(48:end))/length(Kv(48:end))
