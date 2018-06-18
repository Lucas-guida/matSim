% make_block_special.m

clear; close all;

Lx = 0.15;
Ly = 0.05;
Lz = 0.30;

% Vertices
VertexData = [Lx*ones(8,1),Ly*ones(8,1),Lz*ones(8,1)]...
    .*[0,0,0;
    1,0,0;
    0,1,0;
    0,0,1;
    1,1,0;
    0,1,1;
    1,0,1;
    1,1,1];

% Patches
Index_Patch = ...
    [1,2,5,3;
    1,3,6,4;
    1,4,7,2;
    4,7,8,6;
    2,5,8,7;
    3,6,8,5];

n_pat = 6;

for i_pat=1:n_pat
    
    % Patches data
    PatchData_X(:,i_pat) = VertexData(Index_Patch(i_pat,:),1);
    PatchData_Y(:,i_pat) = VertexData(Index_Patch(i_pat,:),2);
    PatchData_Z(:,i_pat) = VertexData(Index_Patch(i_pat,:),3);
end

% Draw patches
figure(1);
h = patch(PatchData_X,PatchData_Y,PatchData_Z,'y');
set(h,'FaceLighting','phong','EdgeLighting','phong');
set(h,'EraseMode','normal');

% Axes settings
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);
set(gca,'FontSize',14);
axis vis3d equal;
view([-37.5,30]);
camlight;
grid on;
xlim([-0.15,0.35]);
ylim([-0.2,0.3]);
zlim([-0.1,0.4]);