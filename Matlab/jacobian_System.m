%% ERGASIA ROMPOTIKH
%% NIKOLAOS ISTATIADIS  9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IAKWBIANH SYSTHMATOS
function [J_sys] = jacobian_System(qlast,ly,lwr,xBE,yBE,theta)

%% IAKWBIANH ROMPOTIKOU VRAXIONA
J_p = jacob0(lwr,qlast);
 
%% IAKWBIANH PLATFORMAS
J_r = [ 1 0 -ly*cos(theta)-(xBE*sin(theta) + yBE*cos(theta));
        0 1 -ly*sin(theta)+(xBE*cos(theta) - yBE*sin(theta));
        0 0  0;
        0 0  0;
        0 0  0;
        0 0  1];
  
%% IAKWBIANH SUSTHMATOS(BRAXIONA-PLATFORMAS)
[J_sys] = [J_p J_r];

end