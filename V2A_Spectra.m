clear; clc; close all;

%% read in audio file
%[y,Fs] = audioread('Vitas.m4a'); Fnm = 'Vitas';
%[y,Fs] = audioread('ChenYX.m4a'); Fnm = 'Eason Chan';
[y,Fs] = audioread('YangHJ.m4a'); Fnm = 'Hongji Yang';

%% Transform to frequency domain

T = 1/Fs;
L = length(y);
t = (0:L-1)*T;

f = Fs*(0:(L/2))/L;
Y = fft(y(:,1));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%% Figure
figure
subplot(3,1,1)
plot(t,y(:,1),'k');
xlim([0 16]);
xlabel('Time (sec)')
ylabel('Amplitude (count)');
title(Fnm)
set(gca,'FontSize',20)

subplot(3,1,2)
P1 = movmean(P1,10000);
plot(f/1e3,P1/mean(P1(end-1e3:end)),'k','LineWidth',3);
xlabel('Frequency (kHz)')
xlim([0 20e3/1e3])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)

save([Fnm '.mat'],'f','P1')

subplot(3,1,3)
[s,f,t]=spectrogram(y(:,1),1024,512,1024,Fs,'yaxis');
temp = log10(abs(s));
pcolor(t,f/1e3,temp);
caxis([min(temp(:))/5 max(temp(:))*2])
ylabel('Frequency (kHz)')
xlabel('Time (sec)')
colormap("jet");
xlim([0 16]); ylim([0 20])
shading interp;
set(gca,'FontSize',20)

%% Compare spectrua
figure
subplot(2,1,1)
load('Yang.mat');
plot(f/1e3,P1/mean(P1(end-1e3:end)),'k','LineWidth',3); hold on;
load('Vitas.mat');
plot(f/1e3,P1/mean(P1(end-1e3:end)),'r','LineWidth',3); hold on;

legend('Hongji Yang','Vitas')
xlabel('Frequency (kHz)')
xlim([0 20e3/1e3])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)

subplot(2,1,2)
load('Yang.mat');
semilogy(f/1e3,P1/mean(P1(end-1e3:end)),'k','LineWidth',3); hold on;
load('Vitas.mat');
semilogy(f/1e3,P1/mean(P1(end-1e3:end)),'r','LineWidth',3); hold on;

legend('Hongji Yang','Vitas')
xlabel('Frequency (kHz)')
xlim([0 20e3/1e3])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)
