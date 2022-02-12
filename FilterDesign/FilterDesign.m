close all
clear all
clc

%% Input for Cirrus CS5343 A/D I2S Slave Mode Approximation

% High dual speed data extracted from datasheet:
% https://statics.cirrus.com/pubs/proDatasheet/CS5343-44_F5.pdf

f_CLK = 50e6; % [Hz] Clock Speed of Mojo V3 Board

f_MCLK = f_CLK/2; % [Hz] Reduced clock to half speed
% This was made intentionally because of CS5343 limitations

MCLK_LRCK_ratio = 256; % Oversampling: the lowest, the fastest
SCLK_LRCK_ratio = 64;  % the highest, the fastest

MCLK_SCLK_ratio = MCLK_LRCK_ratio / SCLK_LRCK_ratio; % To obtain f_SCLK

f_SCLK = f_MCLK / MCLK_SCLK_ratio; % [Hz] Input Sample Rate

fs = f_SCLK / 64; % [Hz] Sampling frequency [Formula provided in Datasheet]

fprintf('Mojo V3 Board clock frequency: %.2f MHz\n', round(f_CLK/1e6, 2))
fprintf('Master Clock for Cirrus CS5343: %.2f MHz\n', round(f_MCLK/1e6, 2))
fprintf('Audio sampling frequency: %.2f KHz\n', round(fs/1e3, 2))
fprintf('Signal clocks per each master clock: %d\n\n', MCLK_SCLK_ratio)

%% Butterworth filter design

% Cutoff frequencies
fL = 100; % Lower
fH = 3e3; % Higher

wL = 2*pi*fL; % Angular high cutoff frequency
wH = 2*pi*fH; % Angular low cutoff frequency

% ws = 2*pi*fs; Angular step frequency

fn = fs/2; % Nyquist frequency;
Ts = 1/fs; % Audio sample time

order = 16; % Single (low or high) filter order

% Design bandpass filter of order 4 with low/high frequency at fL and fH
BPFd = designfilt('bandpassiir', ...
    'FilterOrder', order, ...
    'HalfPowerFrequency1', fL, ...
    'HalfPowerFrequency2', fH, ...
    'SampleRate', fs);
BPF = single(BPFd);        % Cast filter to single precision number coding
coeff = BPF.Coefficients;  % Load coefficients

coeffdim = size(coeff);  % Dimensions of coefficients array [rows columns]
% Each row of coefficient array is a stage of filter

num = coeff(1:coeffdim(1),1:(coeffdim(2)/2));
den = coeff(1:coeffdim(1),(coeffdim(2)/2 + 1):coeffdim(2));

%% Start displaying vectors of numerators and denominators

for i = 1:coeffdim(1)
    fprintf('Stage N° %d\n', i)
    fprintf('Num vector: [')
    for j = 1:coeffdim(2)/2
        fprintf('%f', coeff(i, j))
        if j ~= coeffdim(2)/2
            fprintf(' ')
        else
            fprintf(']\n')
        end
    end
    fprintf('Den vector: [')
    for j = (coeffdim(2)/2 + 1):coeffdim(2)
        fprintf('%f', coeff(i, j))
        if j ~= coeffdim(2)
            fprintf(' ')
        else
            fprintf(']\n\n')
        end
    end
end

%% Display binary values for constants in single precision format IEEE 754

fprintf('Binary numbers with IEEE 754 single precision format will be\n')
fprintf('displayed. These are coefficients of first and second stage of\n')
fprintf('the BPF filter. Denominator coefficients have been negated to\n')
fprintf('match the addition with the numerator multiplications.\n\n')

fprintf('This is because each stage has the system format:\n')
fprintf('y[k] = a_0*r[k] + a_2*r[k-2] - b_0*y[k-1] - b_1*y[k-2]\n\n')
fprintf('So the final system with negated b coefficients would be:\n')
fprintf('y[k] = a_0*r[k] + a_2*r[k-2] + (-b_0)*y[k-1] + (-b_1)*y[k-2]\n\n')

q = quantizer('single');

for i = 1:coeffdim(1)
    fprintf('Stage N° %d binary coefficient values\n', i)
    fprintf('')
    for j = 1:coeffdim(2)/2
        fprintf('+a%d_%d: %s\n', i, j-1, num2bin(q, coeff(i, j)))
    end
    fprintf('')
    for j = (coeffdim(2)/2 + 1):coeffdim(2)
        fprintf('-b%d_%d: %s\n', i, j-1-coeffdim(2)/2, ...
            num2bin(q, -coeff(i, j)))
    end
    fprintf('\n')
end

%% Final transfer function

H = tf(single(1), single(1), Ts);

for i = 1:coeffdim(1)
    ai = coeff(i, 1:coeffdim(2)/2);
    bi = coeff(i, (coeffdim(2)/2 + 1):coeffdim(2));
    Hi = tf(ai, bi, Ts);
    H = H * Hi;
end

clear ai bi Hi

display(H)

%% Parameters for filter simulation (using SIMULINK)

% I2S two's complement output approximation

% Input

data_width = 24;

% Algorithm

resolution = data_width - 1; % first bit corresponds to sign

max_amplitude = 2^resolution - 1;
min_amplitude = -2^resolution;

offset = (max_amplitude + min_amplitude) / 2;
peak = max_amplitude + offset; % or offset - min_amplitude

% Define amplitudes and frequencies for input and noise signal

A_in = floor(peak * 0.8);
A_noise = floor(peak * 0.1);

f_in = 500; % [Hz] Input frequency
f_noise = 5e3; % [Hz] Noise frequency
