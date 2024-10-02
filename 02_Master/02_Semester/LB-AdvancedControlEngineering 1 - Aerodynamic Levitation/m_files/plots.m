%% RAW DATA
figure('Name', 'Raw Data', 'NumberTitle', 'off');
p1 = plot(
    data.ist.t, data.ist.y, 'k', "Linestyle", '-', 'LineWidth', 1);
axis([0 300 0 3.5]); 
grid on;
xlabel('$$t\rm{\,/\,s}$$', 'Interpreter', 'latex','fontsize', 14)         
ylabel('$$U\rm{\,/\,V}$$', 'Interpreter','latex','fontsize', 14)

hold on;
p2 = plot(
    data.step.t, data.step.y, 'k', "Linestyle", '--', 'LineWidth', 1);
legend('System response', 'System input', 'Interpreter','latex');


%% TRIMMING
figure('Name', 'Trimming', 'NumberTitle', 'off');
p1 = plot(
    data.istTrimmed.t, data.istTrimmed.y, 
    'k', "Linestyle", '-', 'LineWidth', 1);
axis([0 8 0 2.6]); 
grid on;
xlabel('$$t\rm{\,/\,s}$$', 'Interpreter', 'latex','fontsize', 14)         
ylabel('$$U\rm{\,/\,V}$$', 'Interpreter','latex','fontsize', 14)

hold on;
p2 = plot(
    data.stepTrimmed.t, data.stepTrimmed.y, 
    'k', "Linestyle", '--', 'LineWidth', 1);
legend('System response', 'System input', 'Interpreter','latex');


%% NORMALIZE
figure('Name', 'Normalize', 'NumberTitle', 'off');
p1 = plot(
    data.istNorm.t, data.istNorm.y, 
    'k', "Linestyle", '-', 'LineWidth', 1);
axis([0 8 0 1.4]); 
grid on;
xlabel('$$t\rm{\,/\,s}$$', 'Interpreter', 'latex','fontsize', 14)         
ylabel('$$\hat{U}\rm{\,/\,V}$$', 'Interpreter','latex','fontsize', 14)

hold on;
p2 = plot(
    data.stepNorm.t, data.stepNorm.y, 
    'k', "Linestyle", '--', 'LineWidth', 1);
legend('System response normalized', 'System input normalized', 
       'Interpreter','latex');


%% FITTING
figure('Name', 'PT2 Fitting', 'NumberTitle', 'off');
p1 = plot(
    data.istNorm.t, data.istNorm.y, 
    'k', "Linestyle", '-', 'LineWidth', 1);
axis([0 8 0 1.4]); 
grid on;
xlabel('$$t\rm{\,/\,s}$$', 'Interpreter', 'latex','fontsize', 14)         
ylabel('$$\hat{U}\rm{\,/\,V}$$', 'Interpreter','latex','fontsize', 14)

hold on;
p2 = plot(
    data.istNorm.t, unit_step_PT2(data.fitting.coeff, data.istNorm.t), 
    'k', "Linestyle", '--', 'LineWidth', 1);
legend('System response normalized', 'Fitted PT2 System', 
       'Interpreter','latex');

