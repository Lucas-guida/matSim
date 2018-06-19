function obj = make_block(obj)
    Lx = 0.4;
    Ly = 0.4;
    Lz = 0.4;

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

    obj.baseV.x =  PatchData_X ;
    obj.baseV.y =  PatchData_Y ;
    obj.baseV.z =  PatchData_Z ;
    obj.basep = patch(obj.baseV.x, obj.baseV.y, obj.baseV.z, obj.color);

end
