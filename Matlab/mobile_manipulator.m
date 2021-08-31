%% ERGASIA ROMPOTIKH
%% NIKOLAOS ISTATIADIS  9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAIN SCRIPT

clc;
clear;

%% VASIKA COMMANDS GIA TO ROBOTICS TOOLBOX
startup_rvc;
lwr = lwr_create();
lwr.base = transl(0, 0.35, 0.5);

%% STOIXEIA POU MAS DINEI H EKFWNHSH GIA TO AKRO , THN BASH,KAI THN PLATFORMA

% SHMEIA TROXIAS TOU MOBILE MANIPULATOR
pE = [-0.5298 ;0.6559 ;0.9049];
pH = [1;1; 1.1];      %intermediate position
pA = [1.5; 1.5; 0.7];

% ARXIKH THESH TWN ARTHRWSEWN TOU BRAXIONA
q0 = [2.6180, -0.6695 ,  1.2719 ,  3.1416 ,  1.2002 , -0.9821];
qp0 = [0 0 0];
ly = 0.35;


%% ERWTHMA 1
%% EUTHI KINIMATIKO KAI IAKWVIANNH TOU BRAXIONA GIA ARXIKH THESH q0

T0 = lwr.fkine(q0);
T0 = [T0.n T0.o T0.a T0.t ; 0 0 0 1 ];

% KRATAW TON ARXIKO EPITHUMITO PROSANATOLISMO
R0 = [T0(1,1) T0(1,2) T0(1,3);...  
    T0(2,1) T0(2,2) T0(2,3);...
    T0(3,1) T0(3,2) T0(3,3)];

%% IAKWBIANH SYSTHMATOS STHN ARXIKH THESH q0,qm0
Jsys = jacobian_System(q0,ly,lwr,T0(1,4),T0(2,4),0)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ERWTHMA 2
tstep = 0.01;
tf = 10;
time = 0:tstep:tf;

%%  ANALYSH TROXIAS GIA TO AKRO TOU ROMPOTIKOU VRAXIONA
[q,qd,qdd] = polynomial_Orbit(pE,pH,pA,tstep,tf);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ERWTHMA 3
%% ANTISTROFO KINHMATIKO TOU SYSTHMATOS (BRAXIONAS-PLATFORMA)
q_sys = zeros(9, length(time));
dq_sys = zeros(9, length(time));

G0B = zeros(4,4, length(time));
G0M =zeros(4,4, length(time));

QuartenionE = zeros(4, length(time));

V = [ qd(:,1)   qd(:,2)   qd(:,3) zeros(length(time),1) zeros(length(time),1) zeros(length(time),1)]';
q_sys(:,1) = [ q0 qp0]';
h = 0;

for i = 1:length(time)-1
    h = h+1;
 
    % VRISKW SE KATHE EPANALLHPSH TOUS OMEGENHS METASXHMATISMOUS THS BASHS
    % TOU VRAXIONA KAI TOU AKROU TOU VRAXIONA GIA NA BRW TON gBE
    g0E = [R0 [q(h,1); q(h,2); q(h,3)]; 0 0 0 1];
    g0B = [cos(q_sys(9, h)) -sin(q_sys(9, h)) 0 q_sys(7, h)-ly*sin(q_sys(9, h));
        sin(q_sys(9, h)) cos(q_sys(9, h))  0 q_sys(8, h)+ly*cos(q_sys(9, h));
        0                0                1 0.5
        0                0                0 1];
    gBE = g0B\g0E;
    
    % XRHSIMOPOIW TON gBE GIA NA VRW THN IAKWVIANH TOU SUSTHMATOS GIA KATHE
    % EPANALLHPSH ENW TAUTOXRONA ELEGXW AN PERNAEI O BRAXIONAS APO IDIAZON
    % SHMEIA
    J_sys = jacobian_System(q_sys(1:6, h),ly,lwr,gBE(1,4),gBE(2,4),q_sys(9, h)) ;
    if det(J_sys(1:6,1:6))== 0
        print('IDIAZON SHMEIO (det=0)')
        break;
    end
    
    % BRISKW THN TAXUTHTA TWN ARTHRWSEWN SE KATHE EPANALLHPSH
    dq_sys(:,h) = pinv(J_sys)*V(:,h);
    
    % ME THN METHODO EULER UPOLOGIZW TIS GWNIES TWN ARTHRWSEWN ( Euler: Q_NEXT = Q_BEFORE + DQ*Dt)
    q_sys(:,h+1)= q_sys(:,h) + dq_sys(:,h)*tstep;   
    
    % H VASH TOU VRAXIONA ENHMERWNEI THN THESH THS SE KATHE EPANALLHPSH
    lwr.base = g0B;  
    
    % OMOGENHS METASXHMATISMOI POU THA XREIASTW GIA TO VISUALISE
    G0B(:,:,h) = g0B;
    G0M(:,:,h) = G0B(:,:,h);
    G0M(2,4,h) = G0M(2,4,h)-0.35;
    G0M(3,4,h) =0;
    
    % QUARTENIONS TOU AKROU  
    QuartenionE(:,h) = rotm2quat(R0);
    
   % KRATAW STATHERO PROSANATOLISMO STATHERO
    V(:,h)= [qd(h,1) qd(h,2) qd(h,3) 0 0 q_sys(9,h)]';
    
end
QuartenionE(:,end) = QuartenionE(:,end-1);

%% GRAFFIKES PARASTASEIS TWN APOKRISEWN
plot_System_Responses(q_sys,dq_sys,q,qd,QuartenionE,time);

%% PROSWMOIWSEI KAI APEIKONISEI THS KINHSHS TOU MOBILE MANIPULATOR (3D)
t = 1:35:length(time);
flag =1;
figure()
for i=1:35:length(time)
    robot_Visualise(q_sys(1:6,i)',q_sys(7:9,:)', q ,G0B(:,:,i),G0M(:,:,i),flag);
    hold on;
    if i~=t(end)
        clf
    end
end

 
%%
fprintf("**************** PRESS ANY KEY TO CONTINUE ? ******************* \n");
pause;
close all; 
  




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ERWTHMA 4

% SHMEIA TROXIAS TOU MOBILE MANIPULATOR
pE2 = [1.5; 1.5; 0.7];
pH2 = [1.1; 1.1; 0.7];
pF = [g0B(1,4); g0B(2,4)-0.35; 0.6];

%% EUTHI KINIMATIKO KAI IAKWVIANNH TOU BRAXIONA GIA ARXIKH THESH q0'
lwr.base = g0B;  
T02 = lwr.fkine(q_sys(1:6,end));
T02 = [T02.n T02.o T02.a T02.t ; 0 0 0 1 ];

% KRATAW TON ARXIKO EPITHUMITO PROSANATOLISMO
R02 = [T02(1,1) T02(1,2) T02(1,3);...  
    T02(2,1) T02(2,2) T02(2,3);...
    T02(3,1) T02(3,2) T02(3,3)];

%%  ANALYSH TROXIAS GIA TO AKRO TOU ROMPOTIKOU VRAXIONA
[q2,qd2,qdd2] = polynomial_Orbit(pE2,pH2,pF,tstep,tf);

%% ANTISTROFO KINHMATIKO TOU SYSTHMATOS (BRAXIONAS-PLATFORMA)
q_sys2 = zeros(9, length(time));
dq_sys2 = zeros(9, length(time));

G0B2 = zeros(4,4, length(time));
G0M2 =zeros(4,4, length(time));

QuartenionE2 = zeros(4, length(time));
 
V2 = [ qd2(:,1)   qd2(:,2)   qd2(:,3) zeros(length(time),1) zeros(length(time),1) zeros(length(time),1)]';

q_sys2(:,1) = [ q_sys(1:6,end)' qp0]';
g0B2 =  g0B;
 
h = 0;
for i=1:length(time)-1
    h=h+1;
    i
    
    % VRISKW SE KATHE EPANALLHPSH TOUS OMEGENHS METASXHMATISMOUS TOU AKROU
    % TOU VRAXIONA  ENW H BASH PARAMENH STATHERH , GIA NA BRW TON gBE
    g0E2 = [R02 [q2(h,1); q2(h,2); q2(h,3)]; 0 0 0 1];
    gBe2 = g0B2\g0E2; 
    
    % XRHSIMOPOIW TON gBE GIA NA VRW THN IAKWVIANH TOU SUSTHMATOS GIA KATHE
    % EPANALLHPSH ENW TAUTOXRONA ELEGXW AN PERNAEI O BRAXIONAS APO IDIAZON
    % SHMEIA
    J_sys2 = jacobian_System(q_sys2(1:6, h),0,lwr,0,0,0) ;
    
    % STHN SUGKEKRIMENH PERIPTWSH H PLATFORMA DEN KINEITAI OPOTE MHDENIZW
    % THN IAKWBIANH THS SE KATHE EPANALLHPSH
    J_sys2(:,7:9) = 0;
    if det(J_sys2(1:6,1:6))== 0
        print('IDIAZON SHMEIO (det=0)')
        break;
    end
    
    % BRISKW THN TAXUTHTA TWN ARTHRWSEWN SE KATHE EPANALLHPSH
    dq_sys2(:,h) = pinv(J_sys2)*V2(:,h);
     
    % ME THN METHODO EULER PROSEGIZW TIS GWNIES TWN ARTHRWSEWN ME ENA MIKRO
    % SFALMA PANTA ( Euler: Q_NEXT = Q_BEFORE + DQ*Dt)
    q_sys2(:,h+1)= q_sys2(:,h) + dq_sys2(:,h)*tstep;  %ypologismos epomenhs thesis arthrosewn
    
    % QUARTENIONS TOU AKROU  
    QuartenionE2(:,h) = rotm2quat(g0E2(1:3,1:3));
    
end
QuartenionE2(:,end) = QuartenionE2(:,end-1);
%%
for i=1:length(time)
 q_sys2(7:9,i) = pF;
end
%% GRAFFIKES PARASTASEIS TWN APOKRISEWN
plot_System_Responses(q_sys2,dq_sys2,q2,qd2 ,QuartenionE2 ,time);
 
%% PROSWMOIWSEI KAI APEIKONISEI THS KINHSHS TOU MOBILE MANIPULATOR (3D)
t = 1:35:length(time);
flag =2;
figure()
for i=1:35:length(time)
    robot_Visualise (q_sys2(1:6,i)', q_sys2(7:9,:)', q2, G0B(:,:,end-1),G0M(:,:,end-1),flag);
    hold on;
    
    if i~=t(end)
        clf
    end
end
 