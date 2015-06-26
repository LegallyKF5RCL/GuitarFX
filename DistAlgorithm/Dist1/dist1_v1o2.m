clc;
clear all;
close all;
% This algorithm works for a normalized signal that lies between the
% magnitudes of 1 and -1

a = 25; % Originally meant to be adjustable parameter. Now i 
        % think this going to be a set number that affects the type of 
        % distortion applied to signal.
        
%[y, Fs] = audioread('clean1.wav');
[y, Fs] = audioread('EString_82Hz.wav');

% sound(y, Fs);
l=length(y);
o = y(1:l,1);  %Converts from stereo to mono. Easier to deal with for now

o = 20*o;     %Amplifying signal to push values past 1. This I think is 
             %gunna be the adjustable value. Play with this value to 
             %adjust distortion amount
             
n = length(o);%input signal length
ts = linspace(0,10,n);
%out = [];
out = zeros(1, n);
for i=1:n
    x = o(i);
    %x = cos(Freq*2*pi*ts(i)); %Example input signal. Simple cos wave for now
    
%if abs(x) < 0
    %out(i) = x;
    
if x<-1
   out(i) = -2/3; %clips signal below -1
elseif x>1
    out(i) = 2/3;  %clips signal above 1
    
elseif -1<=x<= 1
    
out(i) = (x- a*(x.^19)/100); 
                           %function that provides the variable clipping. 
                           %Order of polynoimail affects harmonics generated.
                           %Even order generates even harmonics and odd 
                           %generates odd harmonics


            
    %out(i) = x*(abs(x) + a)/(x^2 + (a-1)*abs(x) + 1); old funtion that i'm
    %keeping for now
end
end

%out = (a/90+1)*out;  %amping output up to magnitude of original. 
                     %Can comment out to see unamplified clipped signal

%normalizing signal                     
m = max(abs(out));
out = out/m;

%plot(ts, cos(Freq*2*pi*ts), 'r');

figure
plot(ts,out);
% sound(out,Fs)

%Waveshaping theory is key to dialing in the distorition algorithm.
%Polynomial functions can generate harmonics based on order of the
%polynomial. Analog distortion generates harmnonics, both even and odd.
%Chebyshev's polynomial equations may be useful. Further study is required. 

