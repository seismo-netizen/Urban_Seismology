clear; clc; close all;
% Modified from CSDN 51星系
% https://blog.csdn.net/stk10/article/details/8922621

fs = 44100; % sample rate 
dt = 1/fs; 

T16 = 0.125; 

t16 = 0:dt:T16; 
[~, k] = size(t16); 

t4 = linspace(0,4*T16,4*k); 
t8 = linspace(0,2*T16,2*k); 

[~, i] = size(t4); 
[~, j] = size(t8); 

% Modification functions 
mod4 = sin(pi*t4/t4(end)); 
mod8 = sin(pi*t8/t8(end)); 
mod16 = sin(pi*t16/t16(end)); 

f0 = 2*146.8; % reference frequency 

ScaleTable = [2/3 3/4 5/6 15/16 ... 
1 9/8 5/4 4/3 3/2 5/3 9/5 15/8 ... 
2 9/4 5/2 8/3 3 10/3 15/4 4 ... 
1/2 9/16 5/8]; 
% 1/4 notes 
do0f = mod4.*cos(2*pi*ScaleTable(21)*f0*t4); 
re0f = mod4.*cos(2*pi*ScaleTable(22)*f0*t4); 
mi0f = mod4.*cos(2*pi*ScaleTable(23)*f0*t4); 

fa0f = mod4.*cos(2*pi*ScaleTable(1)*f0*t4); 
so0f = mod4.*cos(2*pi*ScaleTable(2)*f0*t4); 
la0f = mod4.*cos(2*pi*ScaleTable(3)*f0*t4); 
ti0f = mod4.*cos(2*pi*ScaleTable(4)*f0*t4); 
do1f = mod4.*cos(2*pi*ScaleTable(5)*f0*t4); 
re1f = mod4.*cos(2*pi*ScaleTable(6)*f0*t4); 
mi1f = mod4.*cos(2*pi*ScaleTable(7)*f0*t4); 
fa1f = mod4.*cos(2*pi*ScaleTable(8)*f0*t4); 
so1f = mod4.*cos(2*pi*ScaleTable(9)*f0*t4); 
la1f = mod4.*cos(2*pi*ScaleTable(10)*f0*t4); 
tb1f = mod4.*cos(2*pi*ScaleTable(11)*f0*t4); 
ti1f = mod4.*cos(2*pi*ScaleTable(12)*f0*t4); 
do2f = mod4.*cos(2*pi*ScaleTable(13)*f0*t4); 
re2f = mod4.*cos(2*pi*ScaleTable(14)*f0*t4); 
mi2f = mod4.*cos(2*pi*ScaleTable(15)*f0*t4); 
fa2f = mod4.*cos(2*pi*ScaleTable(16)*f0*t4); 
so2f = mod4.*cos(2*pi*ScaleTable(17)*f0*t4); 
la2f = mod4.*cos(2*pi*ScaleTable(18)*f0*t4); 
ti2f = mod4.*cos(2*pi*ScaleTable(19)*f0*t4); 
do3f = mod4.*cos(2*pi*ScaleTable(20)*f0*t4); 
blkf = zeros(1,i); 

% 1/8 notes 
fa0e = mod8.*cos(2*pi*ScaleTable(1)*f0*t8); 
so0e = mod8.*cos(2*pi*ScaleTable(2)*f0*t8); 
la0e = mod8.*cos(2*pi*ScaleTable(3)*f0*t8); 
ti0e = mod8.*cos(2*pi*ScaleTable(4)*f0*t8); 
do1e = mod8.*cos(2*pi*ScaleTable(5)*f0*t8); 
re1e = mod8.*cos(2*pi*ScaleTable(6)*f0*t8); 
mi1e = mod8.*cos(2*pi*ScaleTable(7)*f0*t8); 
fa1e = mod8.*cos(2*pi*ScaleTable(8)*f0*t8); 
so1e = mod8.*cos(2*pi*ScaleTable(9)*f0*t8); 
la1e = mod8.*cos(2*pi*ScaleTable(10)*f0*t8); 
tb1e = mod8.*cos(2*pi*ScaleTable(11)*f0*t8); 
ti1e = mod8.*cos(2*pi*ScaleTable(12)*f0*t8); 
do2e = mod8.*cos(2*pi*ScaleTable(13)*f0*t8); 
re2e = mod8.*cos(2*pi*ScaleTable(14)*f0*t8); 
mi2e = mod8.*cos(2*pi*ScaleTable(15)*f0*t8); 
fa2e = mod8.*cos(2*pi*ScaleTable(16)*f0*t8); 
so2e = mod8.*cos(2*pi*ScaleTable(17)*f0*t8); 
la2e = mod8.*cos(2*pi*ScaleTable(18)*f0*t8); 
ti2e = mod8.*cos(2*pi*ScaleTable(19)*f0*t8); 
do3e = mod8.*cos(2*pi*ScaleTable(20)*f0*t8); 
blke = zeros(1,j); 

% 1/16 notes 
fa0s = mod16.*cos(2*pi*ScaleTable(1)*f0*t16); 
so0s = mod16.*cos(2*pi*ScaleTable(2)*f0*t16); 
la0s = mod16.*cos(2*pi*ScaleTable(3)*f0*t16); 
ti0s = mod16.*cos(2*pi*ScaleTable(4)*f0*t16); 
do1s = mod16.*cos(2*pi*ScaleTable(5)*f0*t16); 
re1s = mod16.*cos(2*pi*ScaleTable(6)*f0*t16); 
mi1s = mod16.*cos(2*pi*ScaleTable(7)*f0*t16); 
fa1s = mod16.*cos(2*pi*ScaleTable(8)*f0*t16); 
so1s = mod16.*cos(2*pi*ScaleTable(9)*f0*t16); 
la1s = mod16.*cos(2*pi*ScaleTable(10)*f0*t16); 
tb1s = mod16.*cos(2*pi*ScaleTable(11)*f0*t16); 
ti1s = mod16.*cos(2*pi*ScaleTable(12)*f0*t16); 
do2s = mod16.*cos(2*pi*ScaleTable(13)*f0*t16); 
re2s = mod16.*cos(2*pi*ScaleTable(14)*f0*t16); 
mi2s = mod16.*cos(2*pi*ScaleTable(15)*f0*t16); 
fa2s = mod16.*cos(2*pi*ScaleTable(16)*f0*t16); 
so2s = mod16.*cos(2*pi*ScaleTable(17)*f0*t16); 
la2s = mod16.*cos(2*pi*ScaleTable(18)*f0*t16); 
ti2s = mod16.*cos(2*pi*ScaleTable(19)*f0*t16); 
do3s = mod16.*cos(2*pi*ScaleTable(20)*f0*t16); 
blks = zeros(1,k); 

% Get dirty 
y = [so2e mi2s fa2s so2e mi2s fa2s so2s so1s la1s ti1s ... 
do2s re2s mi2s fa2s mi2e do2s re2s... 
mi2e mi1s fa1s so1s la1s so1s fa1s so1s mi1s fa1s so1s... 
fa1e la1s so1s fa1e mi1s re1s mi1s re1s do1s re1s mi1s fa1s so1s la1s... 
fa2e la1s so1s la1e ti1s do2s so1s la1s ti1s do2s re2s mi2s fa2s so2s...% 
so2e mi2s fa2s so2e mi2s fa2s so2s so1s la1s ti1s ... 
do2s re2s mi2s fa2s mi2e do2s re2s... 
mi2e mi1s fa1s so1s la1s so1s fa1s so1s mi1s fa1s so1s... 
fa1e la1s so1s fa1e mi1s re1s mi1s re1s do1s re1s mi1s fa1s so1s la1s... 
fa2e la1s so1s la1e ti1s do2s so1s la1s ti1s do2s re2s mi2s fa2s so2s...% 
];
y = y/max(y); 

sound(y,fs);

audiowrite('Canon.wav',y,fs);
%%
T = 1/fs;
L = length(y);
t = (0:L-1)*T;

f = fs*(0:(L/2))/L;
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
subplot(3,1,1)
plot(t,y,'k')
xlim([0 16]);
xlabel('Time (sec)')
ylabel('Amplitude (count)');
title('Do Re Mi Fa So La Ti Do')
set(gca,'FontSize',20)

subplot(3,1,2)
plot(f,P1/mean(P1(end-1e3:end)),'k','LineWidth',3);
xlabel('Frequency (Hz)')
xlim([0 1200])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)


subplot(3,1,3)
[s,f,t]=spectrogram(y,1024,512,1024,fs,'yaxis');
temp = log10(abs(s));
pcolor(t,f,temp);
caxis([min(temp(:))/5 max(temp(:))*2])
ylabel('Frequency (Hz)')
xlabel('Time (sec)')
colormap("jet");
xlim([0 16]); ylim([0 1200])
shading interp;
set(gca,'FontSize',20)