%% Clean up
clear all
close all
clc


%% Raw data
measure = importdata('measure.mat');
data.ist.t = measure.v_sensor.time;
data.ist.y = measure.v_sensor.data;
data.step.t = measure.v_fan.time;
data.step.y = measure.v_fan.data;


%% Trimming data
i_before = 122240;
idx_1 = 122244;
idx_2 = 126000; 
dt = 2e-3;
data.istTrimmed.t = [0:idx_2-idx_1]'*dt;
data.istTrimmed.y = data.ist.y(idx_1:idx_2);
data.stepTrimmed.t = [0:idx_2-idx_1]'*dt;
data.stepTrimmed.y = data.step.y(idx_1:idx_2);

% Normalize Motor
data.GainMotor = data.step.y(idx_1) - data.step.y(i_before);
data.OffsetMotor = data.step.y(i_before); 


%% Normalize data
% Offset
data.OffsetSensor = min(data.istTrimmed.y);
data.istNorm.y = data.istTrimmed.y-data.OffsetSensor;

% Normalize Sensor
idx_1 = 1876;
idx_2 = 3757; 
data.GainSensor = mean(data.istNorm.y(idx_1:idx_2));

data.istNorm.y = data.istNorm.y/data.GainSensor;
data.istNorm.t = data.istTrimmed.t;

data.stepNorm.y = data.stepTrimmed.y/max(data.stepTrimmed.y);
data.stepNorm.t = data.stepTrimmed.t;


%% Fitting data
data.fitting.Para.a=1; %k
data.fitting.Para.b=2; %w_n
data.fitting.Para.c=0.8; %zeta
data.fitting.coeff = lsqcurvefit(
    @unit_step_PT2, 
    [data.fitting.Para.a data.fitting.Para.b data.fitting.Para.c], 
    data.istNorm.t, data.istNorm.y);


%% State space model
[A B C D] = tf2ss(
    data.fitting.coeff(2)^2, 
    [1 
    2*data.fitting.coeff(3)*data.fitting.coeff(2) 
    data.fitting.coeff(2)^2]);


%% pole placement for state feedback
data.pp.ss.ts = 4; % in s
data.pp.ss.ps = 5/100; % in %

% Calculation of zeta 
data.pp.ss.zeta = sqrt(log(data.pp.ss.ps)^2/(pi^2+log(data.pp.ss.ps)^2));

% Calculation of natural frequency
data.pp.ss.w_n = 4/(data.pp.ss.zeta*data.pp.ss.ts);

% Calcuate the pole regions complex conjugated:
data.pp.ss.p2 = 
    -data.pp.ss.zeta*data.pp.ss.w_n + 
    1i * data.pp.ss.w_n*sqrt(1-data.pp.ss.zeta^2);
data.pp.ss.p3 = 
    -data.pp.ss.zeta*data.pp.ss.w_n - 
    1i * data.pp.ss.w_n*sqrt(1-data.pp.ss.zeta^2);

% Add 3th pole which is nondominant ==> so more left
data.pp.ss.p1 = real(data.pp.ss.p2) * 2;
data.pp.ss.pl = [data.pp.ss.p1;data.pp.ss.p2;data.pp.ss.p3]

% Calculate new matrices: 
% No error according due to step input see script ex. 3.4
A_strich = [0,-C;
            0, A(1,1),A(1,2);
            0 ,A(2,1),A(2,2)];

B_strich = [0;B];

% Poleplacement: 
data.pp.ss.K = place(A_strich,B_strich,data.pp.ss.pl)
data.pp.ss.Ki = data.pp.ss.K(1)-1;
data.pp.ss.Kp = data.pp.ss.K(2:end);


%% Pole placement for obeserver gain
data.pp.ss.os = [-4; -6];
% Poleplacement
data.pp.ss.L = place(A',C',data.pp.ss.os);
data.pp.ss.L = data.pp.ss.L';

