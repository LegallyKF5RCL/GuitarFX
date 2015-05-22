clc;
clear all;
close all;
format shorteng;

N = 1 * 10^6;       %Sample size for sweeping components

KLP = 1;            %gain
OmegaP = 20000;         %3db point
QP = 2;             %Quality factor

% R = 10 * 10^3;      %Select resistor value
R = linspace(1000, 100000, N);      %sweep resistor R from 1ohm to 100kohm

R3 = R;
R4 = R;

C2 = zeros(1, N);
C5 = zeros(1, N);
R1 = zeros(1, N);


for jj = 1:N
    C2(1, jj) = ((KLP + 2)*QP) / (OmegaP * R(1, jj));
    C5(1, jj) = 1 / ((KLP+  2) * QP * OmegaP * R(1, jj));
    R1(1, jj) = R(1, jj) / KLP;
end

subplot(3,1,1);
plot(R, C2);
title('Capacitor 2');

subplot(3,1,2);
plot(R, C5);
title('Capactior 5');

subplot(3,1,3);
plot(R, R1);
title('Resistor 1');


s = tf('s');

Numer = KLP * OmegaP^2;
Denom = s^2 + (OmegaP / QP) * s + OmegaP^2;

% Numer = -(10000 / 10000) * (1 / (10000*10000*));

Gv = Numer / Denom;
Bi1Response = Gv;
Bi2Response = Gv * Gv;
Bi3Response = Gv * Gv * Gv;


figure;
subplot(3,1,1);
bode(Bi1Response);
title('Frequency response: 1 Biquad');

subplot(3,1,2);
bode(Bi2Response);
title('Frequency response: 2 Biquads');

subplot(3,1,3);
bode(Bi3Response);
title('Frequency response: 3 Biquads');
















