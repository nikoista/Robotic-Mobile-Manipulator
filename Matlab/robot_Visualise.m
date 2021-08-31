%% ERGASIA ROMPOTIKH
%% NIKOLAOS ISTATIADIS  9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROSOMOIWSH TWN ANTIKEIMENWN STON XWRO
function robot_Visualise(q,qm,Q,g0B,g0M,flag)

%% DHMIOURGIA TOU ANTIKEIMENOU (KULINDROS)
r = 0.025; 
h = 0.1; 

%% GIA TO 3 KAI 4 ERWTHMA SHMEIO TOPOTHETHSHS TOU KULINDROU STON 3D XWRO
if flag==1
    x0 = 1.5; % based at [1.5 1.5 0.6]
    y0 = 1.5;
    z0 = 0.6;
else
    x0 = 1.7230; 
    y0 = 0.5852;
    z0 = 0.6;
end

[cylx, cyly, cylz] = cylinder(r);
cylx = cylx + x0;
cyly = cyly + y0;
cylz = cylz*h + z0;


%% TOPOTHETHSH TWN TIMWN TWN AXWNWN
axis([-1 3 -1.5 3 0 1.5]);
hold on;

surf(cylx,cyly,cylz,'FaceAlpha',0.8 ,'EdgeColor','red');
hold on;


%% DHMIOURGIA TRAPEZIOU
P = [1.5,1.5,0.3] ;    
L = [0.35,0.35,0.6] ;   
O = P-L/2 ;        

%% SUNARTHSH DHMIOURGIAS KUBWN GIA THN PLATFORMA KAI TO TRAPEZI
plotcube(L,O,.8,[1 1 0]);    
hold on;

%% PROSOMEIWSH KAI APEIKONHSH

%% SUNEXH METATOPOISH TWN SHMEIWN STON 3D XWRO GIA THN SUNEXH APEIKONISH
x0 = -0.75/2+g0M(1,4); 
x1= 0.75/2+g0M(1,4);
y0 = -0.5+g0M(2,4);
y1 = 0.5+g0M(2,4);
z0 = 0 ;
z1 = 0.5 ;

vert = [x0,y0,z0; x1,y0,z0; x1,y1,z0; x0,y1,z0;...
    x0,y0,z1; x1,y0,z1; x1,y1,z1; x0,y1,z1];
fac =[1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];
patch('Vertices',vert,'Faces',fac,'FaceColor','blue','FaceAlpha',.3);
hold on;

%% SXEIDASH TROXIAS AKROU KAI PLATFORMAS SE 3D
plot3(Q(:,1),Q(:,2),Q(:,3),'LineStyle','--', 'LineWidth',1, 'MarkerEdgeColor','r');
xlabel('X')
ylabel('Y')
zlabel('Z')
hold on;
z_plat = zeros(1,length(qm));
plot3(qm(:,1),qm(:,2),z_plat,'LineStyle','--', 'LineWidth',1, 'MarkerEdgeColor','blue');
 
%% SUNEXH METATOPOISH THS BASHS TOU VRAXIONA(WSTE NA EINAI PANA PANW STHN PLATFORMA)
lwr=lwr_create();
lwr.base = g0B;
plot(lwr,q,'nobase')

 
end