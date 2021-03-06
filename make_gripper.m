function obj = make_gripper(obj)
    Lx = 0.02;
    Ly = 0.1;
    Lz = 0.05;

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
        PatchData_XL(:,i_pat) = VertexData(Index_Patch(i_pat,:),1);
        PatchData_YL(:,i_pat) = VertexData(Index_Patch(i_pat,:),2);
        PatchData_ZL(:,i_pat) = VertexData(Index_Patch(i_pat,:),3);
        PatchData_XR(:,i_pat) = VertexData(Index_Patch(i_pat,:),1);
        PatchData_YR(:,i_pat) = VertexData(Index_Patch(i_pat,:),2);
        PatchData_ZR(:,i_pat) = VertexData(Index_Patch(i_pat,:),3);
    end

    % Draw patches

    obj.gripV.left.x =  PatchData_XL - 0.05 + 0.2 -0.02;
    obj.gripV.left.y =  PatchData_YL + 0.43;
    obj.gripV.left.z =  PatchData_ZL + 0.775;
    obj.basep = patch(obj.gripV.left.x, obj.gripV.left.y, obj.gripV.left.z, obj.color);

    obj.gripV.right.x =  PatchData_XL + 0.05 + 0.2;
    obj.gripV.right.y =  PatchData_YL + 0.43;
    obj.gripV.right.z =  PatchData_ZL + 0.775;
    obj.basep = patch(obj.gripV.right.x, obj.gripV.right.y, obj.gripV.right.z, obj.color);
end