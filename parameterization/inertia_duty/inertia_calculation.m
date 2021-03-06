clear;clc;close;
!synclient HorizTwoFingerScroll=0



%Measured data
f = 5e3 : 5e3 : 70e3;
V_pp = [20.0 18.2 18.0 18.0 17.3 17.1 17.1 17.2 17.2 16.8 16.9 16.9 17.0 17.0];
I_rip = [620 350 253 200 170 147 123 113 103 94.4 86.5 81.0 74.0 71.4]*1e-3;

f1 = 2e3: 2e3 :50e3;
V_pp1 = [20.7 20.0 19.2 18.7 18.6 18.2 18.1 17.5 17.7 17.7 17.6 17.5 17.3 16.8 17.0 16.8 16.9 17.0 17.0 16.9 17.1 16.9 16.9 16.7 16.7];
I_rip1 = [1320 755 550 417 337 290 255 229 208 191 176 164 155 145 137 129 123 118 113 109 104 100 96.8 93.3 90.7]*1e-3;

D = 0.5;


%Calculate
T = 1./f;
L = D.*T.*V_pp./I_rip

T1 = 1./f1;
L1 = D.*T1.*V_pp1./I_rip1;


%Calculate mean L of samples above 25kHz
i = find(f>25e3,1);
mean_L = mean(L(i:end));

i1 = find(f1>25e3,1);
i2 = find(f1>35e3,1)

mean_L1 = mean(L1(i1:i2))


%Calculate the difference between real L
real_La = 2.5e-3;
diff = (mean_L-real_La)/real_La *100
diff1 = (mean_L1-real_La)/real_La *100




%Layout Docu
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
%axis([-0.005 0.08 -0.05 1.5])
title('Inductance as a function of frequency')
xlabel('Frequency [Hz]') % x-axis label
ylabel('Inductance [L]') % y-axis label
hold on
plot(f1,L1,'o')
ax = gca;
diff = (mean_L-real_La)/real_La *100
diff1 = (mean_L1-real_La)/real_La *100




%Layout Docu
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
%axis([-0.005 0.08 -0.05 1.5])
title('Inductance as a function of frequency')
xlabel('Frequency [Hz]') % x-axis label
ylabel('Inductance [L]') % y-axis label
hold on
plot(f1,L1,'o')
ax = gca;
ax.XAxis.Exponent = 3;

%Plot mean L level
hline = refline([0 mean_L1]);
hline.Color = 'r';
hline.LineStyle = '--';

hold off


data = importdata('C1duty00000.dat');
data1 = importdata('C2duty00000.dat');
var1 = data(:,1);
var2 = data(:,2);
var11 = data1(:,1);
var12 = data1(:,2);


%Layout Docu
fig_x = 400*2; fig_y = 225*2;
figure('Position',[100,100,fig_x,fig_y])
title('Inductance as a function of frequency')
xlabel('Frequency [Hz]') % x-axis label
ylabel('Inductance [L]') % y-axis label
hold on
plot(f,L,'o')
ax = gca;
ax.XAxis.Exponent = 3;

subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(var1,var2)
title('Current - Half Dutycycle')
xlabel('Time [s]') % x-axis label
ylabel('Current [A]') % y-axis label
axis([-1e-4 1e-4 -0.15 0.06])
ax = gca;
ax.XTick = [-1e-4 -0.5e-4 0 0.5e-4 1e-4];

subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(var11,var12,'r')       % plot using + markers
title('Voltage - Half Dutycycle')
xlabel('Time [s]') % x-axis label
ylabel('Voltage [V]') % y-axis label
axis([-1e-4 1e-4 -20 11])
ax = gca;
ax.XTick = [-1e-4 -0.5e-4 0 0.5e-4 1e-4];
%ax.XAxis.Exponent = -3;
