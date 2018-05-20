%% Initalization of axis and figure
clc
clf
clear all

% [fd bk lt rt]

pos1 = [0.25,0.25,0];
or1 = 0;
color1 = 'Cyan';

pos2 = [1,2,0];
or2 = 0;
color2 = 'Blue';

axes('xlim',[0 2],'ylim',[0 4],'zlim',[0 1.5]);
view(3);
grid on;
axis equal;
hold on;
xlabel('x [2m]');
ylabel('y [4m]');
zlabel('z');

Robot1 = Robot.instance(pos1, color1, or1)

Robot2 = Robot.instance(pos2, color2, or2)

pause(1)

translate(Robot1, [1 0 0 0]);
