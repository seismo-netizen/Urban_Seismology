clear; clc; close all;
% write audio
Fs = 44100; % sampling frequency

% reference
f0 = 440; %Hz la

t = 0:1/Fs:2;
A0 = 0.3;

y = A0*sin(2*pi*(f0*t));

audiowrite('la.wav',y,Fs);

%%
T = 1/Fs;
L = length(y);
t = (0:L-1)*T;

f = Fs*(0:(L/2))/L;
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%% Figure
figure
subplot(3,1,1)
plot(t,y,'k');
xlim([0 0.2]);
xlabel('Time (sec)')
ylabel('Amplitude (count)');
title('La 440 Hz')
set(gca,'FontSize',20)

subplot(3,1,2)
plot(f,P1,'k','LineWidth',3);
xlabel('Frequency (kHz)')
xlim([0 2000])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)

subplot(3,1,3)
[s,f,t]=spectrogram(y,4096,2048,4096,Fs,'yaxis');
temp = log10(abs(s));
pcolor(t,f,temp);
caxis([min(temp(:))/5 max(temp(:))*2])
ylabel('Frequency (Hz)')
xlabel('Time (sec)')
colormap("jet");
xlim([0 2]); ylim([0 2000])
shading interp;
set(gca,'FontSize',20)

%% Do Re Mi Fa So La Ti Do
Fs = 44100; % sampling frequency
% reference
f0 = 440*(2^(3/12))/2; %Hz la
f00 = [f0 f0*2^(2/12) f0*2^(4/12) f0*2^(5/12) f0*2^(7/12)...
    f0*2^(9/12) f0*2^(11/12) f0*2]; 

t = 0:1/Fs:8;
A0 = 0.3;

for i = 1:length(t)
    for j = 1:8
        if (t(i) > j-1) && (t(i) < j)
            y(i) = A0*sin(2*pi*(f00(j)*t(i)));
        end
    end
end

audiowrite('All.wav',y,Fs);

T = 1/Fs;
L = length(y);
t = (0:L-1)*T;

f = Fs*(0:(L/2))/L;
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
% Figure
figure
subplot(3,1,1)
for i = 1:8
    nt1 = (i-1)/T+1;
    nt2 = i/T;
    plot(t(nt1:nt2),y(nt1:nt2)); hold on;
end
xlim([0 8]);
xlabel('Time (sec)')
ylabel('Amplitude (count)');
title('Do Re Mi Fa So La Ti Do')
set(gca,'FontSize',20)

subplot(3,1,2)
%P1 = movmean(P1,10000);
plot(f,P1/mean(P1(end-1e3:end)),'k','LineWidth',3);
xlabel('Frequency (Hz)')
xlim([0 800])
ylabel('Amplitude Spectrum');
set(gca,'FontSize',20)

%save([Fnm '.mat'],'f','P1')

subplot(3,1,3)
[s,f,t]=spectrogram(y,1024,512,1024,Fs,'yaxis');
temp = log10(abs(s));
pcolor(t,f,temp);
caxis([min(temp(:))/5 max(temp(:))*2])
ylabel('Frequency (Hz)')
xlabel('Time (sec)')
colormap("jet");
xlim([0 8]); ylim([0 800])
shading interp;
set(gca,'FontSize',20)