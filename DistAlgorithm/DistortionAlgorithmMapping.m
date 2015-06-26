clc;
clear all;
close all;

n = 1000;       %signal length (specifies number of samples for resolution of plot)
m = 3;         %iterations
k = 20;         %iteration gain multiplier
gain = 1;       %linear gain (previous variable was "o")
power = 19;     %System order (originally set at)

x = linspace(-1,1,n);       %linear space for gain plot
dx = linspace(-1,1,n-1);    %linear space for derivative of gain plot
out = zeros(m, n);          %plot data matrix
Deriv = zeros(m, n - 1);    %derivative plot data matrix

%This nested loop calculates algorithm gain vs input amplitude from -1 to 1
%
%Each iteration calculates the nonlinear gain multiplier (used to be
%variable "a").
%The multiplier is equal to the iteration gain multiplier "k" times the
%current iteration "m" starting at 1, per iteration.
for j = 1:m
    for i = 1:n
        out(j, i) = gain * (x(1, i) - (k * j)*(x(1, i).^power)/100); 
    end
end

plot(x, out);       %plot it!
title('Gain vs. Input Amplitude');
figure;             %hold it!

%For each iteration of the output, calculate the derivative.
for j = 1:m
    for i = 1:n-1
        Deriv(j, i) = (out(j, i + 1) - out(j, i)) * (n / 2);
    end
end

plot(dx, Deriv);    %plot it
title('Derivative of Gain vs. Input Amplitude');








