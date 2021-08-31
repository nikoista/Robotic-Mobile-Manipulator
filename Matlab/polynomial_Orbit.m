%% ERGASIA ROMPOTIKH
%% NIKOLAOS ISTATIADIS  9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SUNARTHSH UPOLOGISMOU TROXIAS
function [q,qd,qdd] = polynomial_Orbit(pE,pC,pA,tstep,tf)

%% XRONOS ARXH,ENDIAMESO SHMEIO,TELOS
t0 = 0;
t1 = 5;
time = t0:tstep:tf;

%% UPOLOGISMOS TWN SUNTELESTWN TWN POLUWNUMWN SUMFWNA ME TOUS TUPOUS TOU 
%% BIBLIOU GIA SXEDIASH TROXIAS ME ENDIAMESO SHMEIO

% GIA THN SUNTETAGMENH X
x10 = pE(1);
x11 = 0;
x12 = (12*pC(1)-3*pA(1)-9*pE(1))/(4*t1^2);
x13 = (-8*pC(1)+3*pA(1)+5*pE(1))/(4*t1^3);

x20 = pC(1);
x21 = (3*pA(1)-3*pE(1))/(4*t1);
x22 = (-12*pC(1)+6*pA(1)+6*pE(1))/(4*t1^2);
x23 = (8*pC(1)-5*pA(1)-3*pE(1))/(4*t1^3);

% GIA THN SUNTETAGMENH Y
y10 = pE(2);
y11 = 0;
y12 = (12*pC(2)-3*pA(2)-9*pE(2))/(4*t1^2);
y13 = (-8*pC(2)+3*pA(2)+5*pE(2))/(4*t1^3);

y20 = pC(2);
y21 = (3*pA(2)-3*pE(2))/(4*t1);
y22 = (-12*pC(2)+6*pA(2)+6*pE(2))/(4*t1^2);
y23 = (8*pC(2)-5*pA(2)-3*pE(2))/(4*t1^3);


% GIA THN SUNTETAGMENH Z
z10 = pE(3);
z11 = 0;
z12 = (12*pC(3)-3*pA(3)-9*pE(3))/(4*t1^2);
z13 = (-8*pC(3)+3*pA(3)+5*pE(3))/(4*t1^3);

z20 = pC(3);
z21 = (3*pA(3)-3*pE(3))/(4*t1);
z22 = (-12*pC(3)+6*pA(3)+6*pE(3))/(4*t1^2);
z23 = (8*pC(3)-5*pA(3)-3*pE(3))/(4*t1^3);
 
%% ARXIKOPOIHSEIS GIA KATHE POLUWNUMO
x = zeros(length(time),1);
xd = zeros(length(time),1);
xdd = zeros(length(time),1);
y = zeros(length(time),1);
yd = zeros(length(time),1);
ydd = zeros(length(time),1);
z = zeros(length(time),1);
zd = zeros(length(time),1);
zdd = zeros(length(time),1);

t = 0;
for i=1:length(time)
    
    if t <= t1
        
        % GIA TO X
        x(i) = x10 + x11*t + x12*t^2 + x13*t^3;
        xd(i) = x11 + 2*x12*t + 3*x13*t^2;
        xdd(i) = 2*x12 + 6*x13*t;
        
        % GIA TO Y
        y(i) = y10 + y11*t + y12*t^2 + y13*t^3;
        yd(i) = y11 + 2*y12*t + 3*y13*t^2;
        ydd(i) = 2*y12 + 6*y13*t;
        
        % GIA TO Z
        z(i) = z10 + z11*t + z12*t^2 + z13*t^3;
        zd(i) = z11 + 2*z12*t + 3*z13*t^2;
        zdd(i) = 2*z12 + 6*z13*t;
        
    elseif t <= tf
        
        % GIA TO X
        x(i) = x20 + x21*(t-t1) + x22*(t-t1)^2 + x23*(t-t1)^3;
        xd(i) = x21 + 2*x22*(t-t1) + 3*x23*(t-t1)^2;
        xdd(i) = 2*x22 + 6*x23*(t-t1);
        
        % GIA TO Y
        y(i) = y20 + y21*(t-t1) + y22*(t-t1)^2 + y23*(t-t1)^3;
        yd(i) = y21 + 2*y22*(t-t1) + 3*y23*(t-t1)^2;
        ydd(i) = 2*y22 + 6*y23*(t-t1);
        
        % GIA TO Z
        z(i) = z20 + z21*(t-t1) + z22*(t-t1)^2 + z23*(t-t1)^3;
        zd(i) = z21 + 2*z22*(t-t1) + 3*z23*(t-t1)^2;
        zdd(i) = 2*z22 + 6*z23*(t-t1);
    end
    
    t = t + tstep;
end

q = [x y z];
qd = [xd yd zd];
qdd = [xdd ydd zdd];
end