function dx = nonlinear(x_prev, u)

x1 = x_prev(1);
x2 = x_prev(2);
x3 = x_prev(3);

FemP1 = 0.017521;
FemP2 = 0.0058231;

ci = -0.4;
ki = 4.4;
m = 0.016;
g = 9.81;

fiP1 = 1.4142e-4;
fiP2 = 4.5626e-3;

x1_dot = x2;
x2_dot = -(x3^2)*(FemP1/(FemP2*2*m))*exp(-x1/FemP2)+g;
x3_dot = 1/((fiP1/fiP2)*exp(-x1/fiP2))*(ki*u+ci-x3);

dx = [x1_dot; x2_dot; x3_dot];

end