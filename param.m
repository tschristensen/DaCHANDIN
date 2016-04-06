clc
clear all

% Pittman 9234 parameters 
Kt = 0.0365;    % Torque Constant [Nm/A]
Ke = 0.036;    % Voltage Constant[V*s/rad]
Ra = 3.647;      % Armature resistance [Ohm]
La = 0.0026;   % Armature Inductance [H] 
Tfv = 2.611e-6;   % Torque viscous friction [Nm*s/rad]
Tfc = 0.0042;   % Torque Coulomb friction [Nm]
Tau_e = 0.00085;% Electrical Time Constant (La/Ra) [s]
Tau_m = 0.0093; % Mechanical Time Constant [s]
%Tau(m) = (R*J)/(Ke*Kt) 
% R: winding resistance 
% J: rotor inertia 
% Ke : back EMF constant 
% Kt : torque constant % 
% (all units metric for this equation) 
% The mechanical time constant represents the amount of time for
% an unloaded motor to rise to 63.2% of its final velocity after application of a command voltage.

Jr = 6.06e-6;    % Rotor inertia [kg*m^2]

% Extra inertia flywheel
r1 = 0.03;          % radius of flywheel [m]
h1  = 0.01;         % Height of the flywheel [m] 
V1 = pi*r1^2*h1;    % volume of the flywheel[m^3] 
V1 = V1*1e6;        % volume of the flywheel [cm^3]
m1 = 2.7*V1/1000;   % mass of the flywheel [(g/cm^3 * cm^3 / 1000) = kg]
J = 1/2*m1*r1^2; % Flywheel inertia [kg*m^2] 
% % transfer functions constants
Km = Ke;


Ts = 0.01;
n = 3;
n_r = 2;

alpha = 1.5*(1+n)/Ts;
alpha_r = 1.5*(1+n)/Ts;

a0 = (Km^2 +Ra*Tfv)/(Jr*La);
a1 = (Jr*Ra+La*Tfv)/(Jr*La);
b0 = Km/(Jr*La);

b0_r = Km/(Ra*Jr);
a0_r = (Km^2+Tfv*Ra)/(Ra*Jr);

%PI D gains for 3rd order, No filter
Ki = (alpha^3)/b0;
Kp = (3*alpha^2-a0)/b0;
Kd = (3*alpha-a1)/(b0);

Ki_r = alpha_r^2/b0_r;
Kp_r = (2*alpha_r-a0_r)/b0_r;
Kd_r = 0;

Hpid = tf([Kd*b0 Kp*b0 Ki*b0],[1 (a1+b0*Kp) (a0+b0*Kp) b0*Ki]);
Hipd = tf(Ki*b0,[1 (a1+b0*Kp) (a0+b0*Kp) b0*Ki]);
N = 10000;
