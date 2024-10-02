function y = unit_step_PT2(par_PT2, t)
k=par_PT2(1);
w_n=par_PT2(2);
zeta=par_PT2(3);

w_d = w_n * sqrt(1 - zeta^2);

y = 1 - (exp(-zeta .* w_n .* t))./(sqrt(1 - zeta^2))  .*
         sin(w_d .* t + atan((sqrt(1 - zeta^2))./(zeta)));
end