%% ERGASIA ROMPOTIKH
%% NIKOLAOS ISTATIADIS  9175

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GRAFFIKES PARASTASEIS APOKRISEWN
function plot_System_Responses(q_sys,qdot_sys,q,qd,QuartenionE,time)

%% APOKRISH STON XRONO TWN GWNIWN TWN ARTHRWSEWN
name = "Joints - Angles";
figure('Name',name,'NumberTitle','off');
title(name)

subplot(3,3,1)
plot(time, q_sys(1,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q1  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time, q_sys(2,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q2  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, q_sys(3,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q3  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,4)
plot(time, q_sys(4,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q4  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,5)
plot(time, q_sys(5,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q5  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,6)
plot(time, q_sys(6,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q6  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');


%% APOKRISH STON XRONO THS THESHS THS PLATFORMAS WS PROS TO ADRANEIAKO PLAISIO {0}
name = "Platform's - Positions";
figure('Name',name,'NumberTitle','off');
title(name)

subplot(3,3,1)
plot(time, q_sys(7,:),'LineWidth',1,'MarkerFaceColor','blue');
ylabel('$$ xM $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time, q_sys(8,:),'LineWidth',1,'MarkerFaceColor','blue');
ylabel('$$ yM  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, q_sys(9,:),'LineWidth',1,'MarkerFaceColor','blue');
ylabel('$$ Fz(angle) $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
 

%% APOKRISH STON XRONO THS THESHS TOU AKROU WS PROS TO ADRANEIAKO PLAISIO {0}
name = "End-Effector's Desired Positions";
figure('Name',name,'NumberTitle','off');
title(name)

subplot(3,3,1)
plot(time, q(:,1),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ xdesire  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time,q(:,2),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ ydesire  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, q(:,3),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ zdesire  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

%% APOKRISH STON XRONO TWN TAXUTHTWN TWN ARTHRWSEWN
name = "Joint's - Velocities";
figure('Name',name,'NumberTitle','off');
 title(name)
 
subplot(3,3,1)
plot(time, qdot_sys(1,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q1dot  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time, qdot_sys(2,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q2dot   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, qdot_sys(3,:),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ q3dot   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,4)
plot(time, qdot_sys(4,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q4dot  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,5)
plot(time, qdot_sys(5,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q5dot   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,6)
plot(time, qdot_sys(6,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ q6dot   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
 

%% APOKRISH STON XRONO TWN TAXUTHTWN THS PLATFORMAS
name = "Platform's - Velocities";
figure('Name',name,'NumberTitle','off');
title(name)

subplot(3,3,1)
plot(time, qdot_sys(7,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ dxm/dt   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time, qdot_sys(8,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ dym/dt   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, qdot_sys(9,:),'LineWidth',1,'MarkerFaceColor','green');
ylabel('$$ dFz/dt   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
 

%% APOKRISH STON XRONO TWN QUARTENIONS TOU AKROU
name = "End-Effector's Quartenions";
figure('Name',name,'NumberTitle','off');
plot(time, QuartenionE,'LineWidth',1,'MarkerFaceColor','black');
ylabel('$$ Quartenions   $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
title(name)

%% APOKRISH STON XRONO TWN TAXUTHTWN TOU AKROU
name = "End-Effector's Desired Velocities";
figure('Name',name,'NumberTitle','off');
title(name)

subplot(3,3,1)
plot(time, qd(:,1),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ dxdes/dt  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,2)
plot(time, qd(:,2),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ dydes/dt  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');

subplot(3,3,3)
plot(time, qd(:,3),'LineWidth',1,'MarkerFaceColor','red');
ylabel('$$ dzdes/dt  $$','Interpreter','Latex');
xlabel('Time (sec)','Interpreter','Latex');
 
%% TROXIA POU AKOLOUTHEI H PLATFORMA SE 3D
name = "Platform's 3D Trajectory-Orbit";
figure('Name',name,'NumberTitle','off');
title(name)
z_plat = zeros(1,length(time));
plot3(q_sys(7,:), q_sys(8,:),z_plat);
xlabel('X')
ylabel('Y')
zlabel('Z')
 

%% TROXIA POU AKOLOUTHEI TO AKRO TOU VRAXIONA SE 3D
name = "End-Effector's Trajectory-Orbit";
figure('Name',name,'NumberTitle','off');
title(name)
plot3(q(:,1), q(:,2),q(:,3));
xlabel('X')
ylabel('Y')
zlabel('Z')
 
end