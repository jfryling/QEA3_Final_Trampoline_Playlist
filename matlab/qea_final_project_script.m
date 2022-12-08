

sampling_frequency = 100; % in Hz

[JoMotionData] = ParseMatlabApp('data/jo_tramp.mat');
Jo_A = getfield(JoMotionData, 'Accel');
Jo_t = getfield(JoMotionData,'t_Accel');

%removing excess data
% Jo_A(4000:end,:)=[];
% Jo_t(4000:end,:)=[];
% Jo_A(1:600,:)=[];
% Jo_t(1:600,:)=[];
Jo_Ay = Jo_A(:,2);

figure(1); clf; hold on;
plot(Jo_t, Jo_Ay)
title('Jo Acceleration in y vs. Time');
xlabel('Time (sec)');
ylabel('Acceleration in y (m/s)');

x = Jo_Ay;
Fs = sampling_frequency;
if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

figure(2); clf; hold on;
plot(linspace(-Fs/2, Fs/2-Fs/length(x),length(x)), 1/length(x)*fftshift(abs(fft(x))))
ylabel('Magnitude of signal');
xlabel('Frequency (Hz)');
title('Jo Frequency');

%---------------------------------------------

[KDMotionData] = ParseMatlabApp('data/kd_tramp.mat');
KD_A = getfield(KDMotionData, 'Accel');
KD_t = getfield(KDMotionData,'t_Accel');
KD_Ay = KD_A(:,2);

figure(3); clf; hold on;
plot(KD_t, KD_Ay)
title('KD Acceleration in y vs. Time');
xlabel('Time (sec)');
ylabel('Acceleration in y (m/s)');

x = KD_Ay;
Fs = sampling_frequency;
if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

figure(4); clf; hold on;
plot(linspace(-Fs/2, Fs/2-Fs/length(x),length(x)), 1/length(x)*fftshift(abs(fft(x))))
ylabel('Magnitude of signal');
xlabel('Frequency (Hz)');
title('KD Frequency');