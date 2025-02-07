%% Clean Up
%clear all
close all
clc


%% Information Abbildung
% Physikalische Größe kursiv
% Einheit normal
% Bildunterschrift
% Auf jede Abbildung muss im Fließtext verwiesen werden
% Abbildungen haben KEINEN eigenen Titel
% Zentriert
% Bei Regressionen keine durchgängigen Linienen einzeichnen
% Abbildungsverzeichnis
% Achsenbeschriftung
% Bei mehr Datenpunkten -> LEGENDE
% Formatierung: Goldener Schnitt (Breite:Höhe = 1.618:1)
% Konsistente Breite für Abbildungen: Z.B. 60% der Textbreite
% Vorschlag Formatierung für TikZ: width=3.5in, height=2.1631644in
% Font size 14


%% Input
x = data.TimeS;
y1 = data.VmMeasuredVoltage;
y2 = data.AmMeasuredCurrent;
y3 = data.SymmetricalPWM;


%% Plot gemäß Laborleitfaden - kontinuierlich
p1 = plot(x, y1, "k", "Linestyle", '-', 'LineWidth', 1);
grid on;

%xlim([0 4])
%ylim([-700 700])

ax = gca; % axes handle
ax.YAxis.Exponent = 0;

% Titel(gemäß Laborleitfaden nicht verwenden)
%title('Gleichrichter');

% x-Achsenbeschriftung
xlabel('$$t\rm{\,/\,s}$$', 'Interpreter', 'latex','fontsize', 14)         
% y-Achsenbeschriftung 
ylabel('$$U\rm{\,/\,V}$$', 'Interpreter','latex','fontsize', 14)

%Gegebenfalls zweiter plot
hold on;
%p2 = plot(x, y2, "k", "Linestyle", '--', 'LineWidth', 1);

%p3 = plot(x, y3, "k", "Linestyle", '-.', 'LineWidth', 1);


%p4 = plot(x, y4, 'k', "Linestyle", ':', 'LineWidth', 1);

legend('Vout', 'Interpreter', 'latex', 'Location', 'northeast')

% legend( 'Constant speed' char(10) 'Constant power, Constant torque, Linear torque, Fan load', ...
%         'Constant power', ...
%         'Constant torque', ...
%         'Linear torque', ...
%         'Fan load', ...
%         'Interpreter', 'latex', 'Location', 'northeast');






%% Plot gemäß Laborleitfaden - kontinuierlich
p1 = plot(x, y1, 'LineWidth', 1);
grid on;

%xlim([0 4])
%ylim([-350 350])

ax = gca; % axes handle
ax.YAxis.Exponent = 0;

% Titel(gemäß Laborleitfaden nicht verwenden)
%title('Gleichrichter');

% x-Achsenbeschriftung
xlabel('$$t\rm{\,/\,ms}$$', 'Interpreter', 'latex','fontsize', 14)         
% y-Achsenbeschriftung 
ylabel('$$P\rm{\,/\,kW}$$', 'Interpreter','latex','fontsize', 14)

%Gegebenfalls zweiter plot
hold on;
p2 = plot(x, y2, 'LineWidth', 1);

p3 = plot(x, y3, 'LineWidth', 1);


%p4 = plot(x, y4, 'k', "Linestyle", ':', 'LineWidth', 1);

legend('Core Losses', 'Eddy Current Losses', 'Excess Losses', 'Hysteresis Losses', 'Interpreter', 'latex', 'Location', 'northeast')








%% Plot gemäß Laborleitfaden - kontinuierlich
p1 = plot(x, y1, "k", "Linestyle", '-', 'LineWidth', 1);
grid on;

%xlim([0 4])
ylim([0 270])

ax = gca; % axes handle
ax.YAxis.Exponent = 0;

% Titel(gemäß Laborleitfaden nicht verwenden)
%title('Gleichrichter');

% x-Achsenbeschriftung
xlabel('$$t\rm{\,/\,ms}$$', 'Interpreter', 'latex','fontsize', 14)         
% y-Achsenbeschriftung 
ylabel('$$P\rm{\,/\,kW}$$', 'Interpreter','latex','fontsize', 14)

%Gegebenfalls zweiter plot
hold on;
p2 = plot(x, y2, "k", "Linestyle", '--', 'LineWidth', 1);

%p3 = plot(x, y3, "k", "Linestyle", '-.', 'LineWidth', 1);


%p4 = plot(x, y4, 'k', "Linestyle", ':', 'LineWidth', 1);

legend('Solid Losses', 'Sum of Stranded Losses', 'Interpreter', 'latex', 'Location', 'northeast')









%% Plot gemäß Laborleitfaden - diskret
% p1 = stairs(t, a, '-', 'LineWidth', 1);
% set(p1, 'color','black');
% axis([0 5 0 2]);                               
% 
% grid on;   
% 
% % Titel(gemäß Laborleitfaden nicht verwenden)
% %title('Gleichrichter');  
% 
% % x-Achsenbeschriftung
% xlabel({'$t$\,/\,s'}, 'Interpreter', 'latex');           
% % y-Achsenbeschriftung 
% ylabel({'$A$'}, 'Interpreter', 'latex');          
% 
% % Gegebenfalls zweiter plot
% hold on;                                                
% 
% p2 = stairs(t, b, '--', 'LineWidth', 1);
% set(p2, 'color','black');


%p3 = plot(t3, a3, ':');
%set(p2, 'color','black');

% legend('Testsignal1', 'Testsignal2', 'Location', 'northeast');


%% Subplots
subplot(2,1,1)
p1 = plot(x, y2, "k", "Linestyle", '-', 'LineWidth', 1);
grid on;
ax = gca; % axes handle
ax.YAxis.Exponent = 0;
% x-Achsenbeschriftung
xlabel('$$\Theta\rm{\,/\,^\circ}$$', 'Interpreter', 'latex','fontsize', 14)         
% y-Achsenbeschriftung 
ylabel('$$I\rm{\,/\,kA}$$', 'Interpreter','latex','fontsize', 14)
grid on
legend('Constant speed')

subplot(2,1,2)
%p2 = plot(x, y4, "k", "Linestyle", '-', 'LineWidth', 1);
grid on;
ax = gca; % axes handle
ax.YAxis.Exponent = 0;
% x-Achsenbeschriftung
xlabel('$$\Theta\rm{\,/\,^\circ}$$', 'Interpreter', 'latex','fontsize', 14)         
% y-Achsenbeschriftung 
ylabel('$$I\rm{\,/\,kA}$$', 'Interpreter','latex','fontsize', 14)
grid on
legend('Constant power')


%% Save plot as PDF
set(gcf,'Units','inches');
pos = get(gcf,'Position');
%set(gcf, 'PaperPosition',[0 0 pos(3:4)],'PaperSize',[pos(3:4)]);
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print -dpdf -painters myFig
