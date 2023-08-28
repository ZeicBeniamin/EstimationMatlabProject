function A = part_deriv(x, Ts)
%PART_DERIV Compute partial derivative matrix of maglev system

x1 = x(1);
x2 = x(2);
x3 = x(3);

FemP1 = 0.017521;
FemP2 = 0.0058231;

ci = -0.4;
ki = 4.4;
m = 0.016;
g = 9.81;

fiP1 = 1.4142e-4;
fiP2 = 4.5626e-3;

a21 = - x3^2/(2*m) * FemP1/FemP2 * exp(-x1/FemP2)/FemP2;
a23 = - x3/m * FemP1/FemP2 * exp(-x1/FemP2);
a33 = - 1/(fiP1/fiP2 * exp(-x1/fiP2));

A = [0      1   0;
     a21    0   a23;
     0      0   a33];

A = eye(3) + Ts * A;

end

