function obj = make_arm_L1(obj)
    Radius = 0.05;
    Height = 0.3;
    SideCount = 20;

    % Vertices
    n_side = SideCount;

    for i_ver=1:n_side
        VertexData(i_ver,:) = [Radius*cos(2*pi/n_side*i_ver),Radius*sin(2*pi/n_side*i_ver),0];
        VertexData(n_side+i_ver,:) = [Radius*cos(2*pi/n_side*i_ver),Radius*sin(2*pi/n_side*i_ver),Height];
    end

    % Side Patches
    for i_pat=1:n_side-1
        Index_Patch1(i_pat,:) = [i_pat,i_pat+1,i_pat+1+n_side,i_pat+n_side];
    end
    Index_Patch1(n_side,:) = [n_side,1,1+n_side,2*n_side];

    for i_pat=1:n_side

        % Side patches data
        PatchData1_X(:,i_pat) = VertexData(Index_Patch1(i_pat,:),1);
        PatchData1_Y(:,i_pat) = VertexData(Index_Patch1(i_pat,:),2);
        PatchData1_Z(:,i_pat) = VertexData(Index_Patch1(i_pat,:),3);
    end

    % Bottom Patches
    Index_Patch2(1,:) = [1:n_side];
    Index_Patch2(2,:) = [n_side+1:2*n_side];

    for i_pat=1:2

        % Bottom patches data
        PatchData2_X(:,i_pat) = VertexData(Index_Patch2(i_pat,:),1);
        PatchData2_Y(:,i_pat) = VertexData(Index_Patch2(i_pat,:),2);
        PatchData2_Z(:,i_pat) = VertexData(Index_Patch2(i_pat,:),3);
    end
    

    % Draw side patches
    obj.armL1V.sides.x =  PatchData1_X + 0.4/2;
    obj.armL1V.sides.y =  PatchData1_Y + 0.4/3;
    obj.armL1V.sides.z =  PatchData1_Z + 0.5;
    obj.armL1p.sides = patch(obj.armL1V.sides.x,obj.armL1V.sides.y,obj.armL1V.sides.z,obj.color);
    
    % Draw bottom patches
    obj.armL1V.topbottom.x =  PatchData2_X + 0.4/2;
    obj.armL1V.topbottom.y =  PatchData2_Y + 0.4/3;
    obj.armL1V.topbottom.z =  PatchData2_Z + 0.5;
    
    obj.armL1p.topbottom = patch(obj.armL1V.topbottom.x,obj.armL1V.topbottom.y,obj.armL1V.topbottom.z,obj.color);
end