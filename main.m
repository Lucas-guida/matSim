%% Initalization of axis and figure
clc,clf,clear all

pos1 = [0.25,0.25,0];
or1 = 0;
color1 = 'Cyan';

pos2 = [1,2,0];
or2 = 0;
color2 = 'magenta';

% initalizing figure
axes('xlim',[0 2],'ylim',[0 4],'zlim',[0 1.5]);
view(3);
set(gca,'FontSize',14);
% camlight;
grid on;
axis equal;
hold on;
xlabel('x [2m]');
ylabel('y [4m]');
zlabel('z');

% creating robot object
Robot1 = Robot.instance(pos1, color1, or1)

pause(1)

% move the robot forward by 1 meter
% Robot1 = rotate(Robot1, 45);
% Robot1
% pause(1)
% Robot1 = translate(Robot1, [1 0 1 0]);
% pause(1)
% Robot1 = rotate(Robot1, -80);
% pause(1)
% Robot1 = translate(Robot1, [1 0 0 1]);
% pause(1)
% Robot1 = translate(Robot1, [0 0 1 0]);