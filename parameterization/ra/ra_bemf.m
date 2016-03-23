clc;clear;close all;

format long;
speed_files = dir('rec1_*.mat');

num = size(speed_files,1);

for i = 1:num
    load(speed_files(i).name);
end

speed_bemf(1) = -1*sum(rec1_002.Y.Data)/length(rec1_002.Y.Data);
speed_bemf(2) = -1*sum(rec1_003.Y.Data)/length(rec1_003.Y.Data);
speed_bemf(3) = -1*sum(rec1_004.Y.Data)/length(rec1_004.Y.Data);
speed_bemf(4) = -1*sum(rec1_005.Y.Data)/length(rec1_005.Y.Data);
speed_bemf(5) = -1*sum(rec1_006.Y.Data)/length(rec1_006.Y.Data);
speed_bemf(6) = -1*sum(rec1_007.Y.Data)/length(rec1_007.Y.Data);
speed_bemf(7) = -1*sum(rec1_008.Y.Data)/length(rec1_008.Y.Data);
speed_bemf(8) = -1*sum(rec1_009.Y.Data)/length(rec1_009.Y.Data);
speed_bemf(9) = -1*sum(rec1_010.Y.Data)/length(rec1_010.Y.Data);
speed_bemf(10) = -1*sum(rec1_011.Y.Data)/length(rec1_011.Y.Data);
speed_bemf(11) = -1*sum(rec1_012.Y.Data)/length(rec1_012.Y.Data);
speed_bemf(12) = -1*sum(rec1_013.Y.Data)/length(rec1_013.Y.Data);
speed_bemf(13) = -1*sum(rec1_014.Y.Data)/length(rec1_014.Y.Data);
speed_bemf(14) = -1*sum(rec1_015.Y.Data)/length(rec1_015.Y.Data);
speed_bemf(15) = -1*sum(rec1_016.Y.Data)/length(rec1_016.Y.Data);
speed_bemf(16) = -1*sum(rec1_017.Y.Data)/length(rec1_017.Y.Data);
speed_bemf(17) = -1*sum(rec1_018.Y.Data)/length(rec1_018.Y.Data);
speed_bemf(18) = -1*sum(rec1_019.Y.Data)/length(rec1_019.Y.Data);
speed_bemf(19) = -1*sum(rec1_020.Y.Data)/length(rec1_020.Y.Data);
speed_bemf(20) = -1*sum(rec1_021.Y.Data)/length(rec1_021.Y.Data);
speed_bemf(21) = -1*sum(rec1_022.Y.Data)/length(rec1_022.Y.Data);
speed_bemf(22) = -1*sum(rec1_023.Y.Data)/length(rec1_023.Y.Data);
speed_bemf(23) = -1*sum(rec1_024.Y.Data)/length(rec1_024.Y.Data);
speed_bemf(24) = -1*sum(rec1_025.Y.Data)/length(rec1_025.Y.Data);
speed_bemf(25) = -1*sum(rec1_026.Y.Data)/length(rec1_026.Y.Data);
speed_bemf(26) = -1*sum(rec1_027.Y.Data)/length(rec1_027.Y.Data);
speed_bemf(27) = -1*sum(rec1_028.Y.Data)/length(rec1_028.Y.Data);
speed_bemf(28) = -1*sum(rec1_029.Y.Data)/length(rec1_029.Y.Data);
speed_bemf(29) = -1*sum(rec1_030.Y.Data)/length(rec1_030.Y.Data);
speed_bemf(30) = -1*sum(rec1_031.Y.Data)/length(rec1_031.Y.Data);
speed_bemf(31) = -1*sum(rec1_032.Y.Data)/length(rec1_032.Y.Data);
speed_bemf(32) = -1*sum(rec1_033.Y.Data)/length(rec1_033.Y.Data);
speed_bemf(33) = -1*sum(rec1_034.Y.Data)/length(rec1_034.Y.Data);
speed_bemf(34) = -1*sum(rec1_035.Y.Data)/length(rec1_035.Y.Data);
speed_bemf(35) = -1*sum(rec1_036.Y.Data)/length(rec1_036.Y.Data);
speed_bemf(36) = -1*sum(rec1_037.Y.Data)/length(rec1_037.Y.Data);
speed_bemf(37) = -1*sum(rec1_038.Y.Data)/length(rec1_038.Y.Data);
speed_bemf(38) = -1*sum(rec1_039.Y.Data)/length(rec1_039.Y.Data);
speed_bemf(39) = -1*sum(rec1_040.Y.Data)/length(rec1_040.Y.Data);

bemf = csvread('v_vs_bemf.csv',1,0)

Km = bemf(:,2)./(speed_bemf(:)*(2*pi/60))

fit1 = fitlm(bemf(:,1),speed_bemf*(2*pi/60))

fig_x = 400*2; fig_y = 225*2;
fitted = fit1.Fitted;
figure('Position',[100,100,fig_x,fig_y])
plot(bemf(:,1),fitted,'-r',bemf(:,1),speed_bemf*(2*pi/60),'o')
legend('Fitted Line','Data Points', 'Location', 'northwest')
title('Current as a Function of Voltage')
xlabel('Voltage [V]')
ylabel('Angular Velocity [Rad/S]')


Km = sum(Km)/length(Km)

velocity(1) = -1*sum(rec1_062.Y.Data)/length(rec1_062.Y.Data)*(2*pi/60);
velocity(2) = -1*sum(rec1_063.Y.Data)/length(rec1_063.Y.Data)*(2*pi/60);
velocity(3) = -1*sum(rec1_064.Y.Data)/length(rec1_064.Y.Data)*(2*pi/60);
velocity(4) = -1*sum(rec1_065.Y.Data)/length(rec1_065.Y.Data)*(2*pi/60);
velocity(5) = -1*sum(rec1_066.Y.Data)/length(rec1_066.Y.Data)*(2*pi/60);
velocity(6) = -1*sum(rec1_067.Y.Data)/length(rec1_067.Y.Data)*(2*pi/60);
velocity(7) = -1*sum(rec1_068.Y.Data)/length(rec1_068.Y.Data)*(2*pi/60);
velocity(8) = -1*sum(rec1_069.Y.Data)/length(rec1_069.Y.Data)*(2*pi/60);
velocity(9) = -1*sum(rec1_070.Y.Data)/length(rec1_070.Y.Data)*(2*pi/60);
velocity(10) = -1*sum(rec1_071.Y.Data)/length(rec1_071.Y.Data)*(2*pi/60);
velocity(11) = -1*sum(rec1_072.Y.Data)/length(rec1_072.Y.Data)*(2*pi/60);
velocity(12) = -1*sum(rec1_073.Y.Data)/length(rec1_073.Y.Data)*(2*pi/60);
velocity(13) = -1*sum(rec1_074.Y.Data)/length(rec1_074.Y.Data)*(2*pi/60);
velocity(14) = -1*sum(rec1_075.Y.Data)/length(rec1_075.Y.Data)*(2*pi/60);
velocity(15) = -1*sum(rec1_076.Y.Data)/length(rec1_076.Y.Data)*(2*pi/60);
velocity(16) = -1*sum(rec1_077.Y.Data)/length(rec1_077.Y.Data)*(2*pi/60);
velocity(17) = -1*sum(rec1_078.Y.Data)/length(rec1_078.Y.Data)*(2*pi/60);
velocity(18) = -1*sum(rec1_079.Y.Data)/length(rec1_079.Y.Data)*(2*pi/60);
velocity(19) = -1*sum(rec1_080.Y.Data)/length(rec1_080.Y.Data)*(2*pi/60);
velocity(20) = -1*sum(rec1_081.Y.Data)/length(rec1_081.Y.Data)*(2*pi/60);
velocity(21) = -1*sum(rec1_082.Y.Data)/length(rec1_082.Y.Data)*(2*pi/60);
velocity(22) = -1*sum(rec1_083.Y.Data)/length(rec1_083.Y.Data)*(2*pi/60);
velocity(23) = -1*sum(rec1_084.Y.Data)/length(rec1_084.Y.Data)*(2*pi/60);
velocity(24) = -1*sum(rec1_085.Y.Data)/length(rec1_085.Y.Data)*(2*pi/60);
velocity(25) = -1*sum(rec1_086.Y.Data)/length(rec1_086.Y.Data)*(2*pi/60);
velocity(26) = -1*sum(rec1_087.Y.Data)/length(rec1_087.Y.Data)*(2*pi/60);
velocity(27) = -1*sum(rec1_088.Y.Data)/length(rec1_088.Y.Data)*(2*pi/60);
velocity(28) = -1*sum(rec1_089.Y.Data)/length(rec1_089.Y.Data)*(2*pi/60);
velocity(29) = -1*sum(rec1_090.Y.Data)/length(rec1_090.Y.Data)*(2*pi/60);
velocity(30) = -1*sum(rec1_091.Y.Data)/length(rec1_091.Y.Data)*(2*pi/60);
velocity(31) = -1*sum(rec1_092.Y.Data)/length(rec1_092.Y.Data)*(2*pi/60);
velocity(32) = -1*sum(rec1_093.Y.Data)/length(rec1_093.Y.Data)*(2*pi/60);
velocity(33) = -1*sum(rec1_094.Y.Data)/length(rec1_094.Y.Data)*(2*pi/60);
velocity(34) = -1*sum(rec1_095.Y.Data)/length(rec1_095.Y.Data)*(2*pi/60);
velocity(35) = -1*sum(rec1_096.Y.Data)/length(rec1_096.Y.Data)*(2*pi/60);
velocity(36) = -1*sum(rec1_097.Y.Data)/length(rec1_097.Y.Data)*(2*pi/60);
velocity(37) = -1*sum(rec1_098.Y.Data)/length(rec1_098.Y.Data)*(2*pi/60);
velocity(38) = -1*sum(rec1_099.Y.Data)/length(rec1_099.Y.Data)*(2*pi/60);
velocity(39) = -1*sum(rec1_100.Y.Data)/length(rec1_100.Y.Data)*(2*pi/60);

i_m = csvread('v_vs_i.csv',1,0);
Re = i_m(1,3)
i_m = i_m(:,2);

r = ((velocity*Km)'./i_m)-Re;
r = sum(r)/length(r)