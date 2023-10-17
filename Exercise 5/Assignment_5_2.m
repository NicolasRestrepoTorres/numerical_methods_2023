clc;

%% Implementation of the butcher Table 
% k1 = f(tn_1, yn_1);
% k2 = f(tn_1 + (tau/2), yn_1 + (tau/2));
% k3 = f(tn_1 + tau, yn_1 + (tau*k3));
% k4 = f(tn_1 + tau, yn_1 + (tau*k3));
% yn = yn_1 + (tau * ((1/6)*k1 + (1/3) * k2 + (1/3) * k3 + (1/6) * k4))


%% Finish equation

%% Implementation
h=0.05;                                             % step size
x = 0:h:100;                                         % Calculates upto y(3)
y = zeros(1,length(x)); 
%y(1) = [-0.5;0.3;0.2];
y(1) = 0.3; % redo with other choices here. 
    % initial condition
F_xy = @(t,y) -10*y + 30 - 18*exp(-t);                    % change the function as you desire
for i=1:(length(x)-1)                              % calculation loop
    k_1 = F_xy(x(i),y(i));
    k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k_4 = F_xy((x(i)+h),(y(i)+k_3*h));
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  % main equation
  
end
% validate using a decent ODE integrator  
tspan = [0,10]; y0 = y(1);
[tx, yx] = ode45(F_xy, tspan, y0);

solution = @(t) 3 - (2*exp(-t)) - 0.7*exp(-10*t);


%loglog
loglog(x,y);
hold on;
loglog(tx,yx);
% Creating table
% tspan2 = linspace(0,10,2001)
% Tbl=table(tspan2',x',y','VariableNames',{'x','y1','y2'});
% 
% % First convert table to cell.
% Tbl_cl=table2cell(Tbl);
% % vertical concantenate table variable names with its values and convert to a string
% Tbl_str=string([Tbl.Properties.VariableNames;Tbl_cl]);
% % set the x,y,width, and height (in that order) of a text box to be added to the plot for example;
% txtdim=[.5 .5 .1 .1];
% % add annotation to the plot specifying the string input argument as character array ("char(Tbl_str)") 
% an=annotation('textbox',txtdim,'String',char(Tbl_str),'FitBoxToText','on');


plot(x,y,'o-', tx, yx, '--')

xlabel('Values')
ylabel('y(t) computed vs numerical method')
title('Real function vs Runge Kutta computed')
fplot(solution, tspan, 'g-');
hold off;




