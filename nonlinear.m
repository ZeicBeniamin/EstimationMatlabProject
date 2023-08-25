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
% 
% clear xls_kn xls_kp store samples iter
% iter = 500;
% Dx0 = [0.004; 
%         -0.15;  
%         2.5];
% xns_n = x0 + Dx0;
% store = zeros(3, iter);
% samples = 1:iter;
% for i = 1:iter
%     xns_p = xns_n;
%     store(:, i) = xns_n;
%     xns_n = xns_p + Ts * nonlinear(xns_p, (-Kd * (xns_p - x0) + u0)); % Ad * xns_p + Bd * (-K*x);
% end
% 
% 
% xlo_n = Dx0;
% xlo_hat_n = Dxh0;
% store = zeros(3, iter);
% 
% for i = 1:iter
%     xlo_p = xlo_n;
%     xlo_hat_p = xlo_hat_n;
% 
%     store(:, i) = xlo_n + x0;
% 
%     xlo_n = Ad * xlo_p + Bd * (-Kd * xlo_hat_p);
%     err = C * (xlo_p - xlo_hat_p);
%     xlo_hat_n = Ad * xlo_hat_p + Bd * (-Kd * xlo_hat_p) + Ld * err;
% end
% 
% % figure