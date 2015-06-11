clc;
clear all;
close all;
format shorteng;


OmegaP = 20000 * 2 * pi;         %3db point
QP1 = .517638083;             %Quality factor
QP2 = 1.414213;
QP3 = 1.931851;

s = tf('s');

Numer1 = OmegaP^2;
Denom1 = s^2 + (OmegaP / QP1) * s + OmegaP^2;

Numer2 = OmegaP^2;
Denom2 = s^2 + (OmegaP / QP2) * s + OmegaP^2;

Numer3 = OmegaP^2;
Denom3 = s^2 + (OmegaP / QP3) * s + OmegaP^2;

Gv1 = Numer1 / Denom1;
Gv2 = Numer2 / Denom2;
Gv3 = Numer3 / Numer3;

Final = Gv1 * Gv2 * Gv3;

figure;
bode(Final);
title('Frequency response: 1 Biquad');

% subplot(3,1,2);
% bode(Bi2Response);
% title('Frequency response: 2 Biquads');
% 
% subplot(3,1,3);
% bode(Bi3Response);
% title('Frequency response: 3 Biquads');







