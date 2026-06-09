m = 1;
b = 2;
g = 9.81;
d = 0.1;    % disturbance magnitude
t_d = 4;    % time at which disturbance appears
n = .01^2;   % noise power
syms s;
P = tf([1],[m b 0]);

%% Controller design
% the controller has the form:   K*C(s) = K*C_n(s)/C_d(s)
C_n = [m/b 1];      % numerator of C(s)
C_d = [1/50 1];     % denominator of C(s)
C = tf(C_n,C_d);
K = 20;             % gain K of the controller

%% open loop analysis
G = C*P;
rlocus(G);
bode(K*G);

%% Reference
r = 1;
