R = 15;
p = 0.71;
interval = linspace(0,30,100);
target_eqn = @(h) h^3 -3*R*h^2 +4*R^3*p;
eqn_values = arrayfun(target_eqn, interval);

plot(interval, eqn_values, '--bx');
xline(0);
yline(0);
legend({'Graphical Representation of the Equation'}, 'Interpreter', 'latex', 'Location','southeast');
