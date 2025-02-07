%% Skript zur Berechnung von Filterschaltungen
% Dieses Skript berechnet die Induktivität, Ausgangsimpedanz und andere
% Parameter einer Filterschaltung basierend auf gegebenen Größen.

% Aufräumen der Arbeitsumgebung
clearvars; % Löscht nur Variablen, lässt offene Figures und Breakpoints unberührt
clc; % Löscht die Kommandozeile

%% Parameterdefinition
f_g = 10e3;         % Grenzfrequenz in Hz
C_f = 200e-9;       % Kapazität in Farad
C_faktor = 20;      % Verhältnis von C_d zu C_f

%% Berechnungen
L_f = 1 / ( (2 * pi * f_g)^2 * C_f ); % Induktivität in Henry
R_0 = sqrt(L_f / C_f);                % Charakteristische Impedanz in Ohm

C_d = C_faktor * C_f;                 % Kapazität C_d in Farad
n = C_d / C_f;                        % Kapazitätsverhältnis

% Widerstand R_d in Ohm
R_d = R_0 * sqrt(((2 + n) * (4 + 3 * n)) / ((2 * n)^2 * (4 + n)));

%% Ausgabe der Ergebnisse
fprintf('Berechnete Parameter:\n');
fprintf('Induktivität L_f: %.4e H\n', L_f);
fprintf('Charakteristische Impedanz R_0: %.4f Ohm\n', R_0);
fprintf('Kapazität C_d: %.4e F\n', C_d);
fprintf('Widerstand R_d: %.4f Ohm\n', R_d);