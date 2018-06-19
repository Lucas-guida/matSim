function obj = make_arm_L2(obj)
    Radius = 0.05;
    Height = 0.3;
    SideCount = 20;
    
        Rx = [1 0 0;
            0 cosd(-90)  -sind(-90);
            0 sind(-90) cosd(-90)];
    
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
    
    % rotate topbottom
    for i=1:n_side
        temp1 = Rx*[PatchData2_X(i,1);PatchData2_Y(i,1);PatchData2_Z(i,1);]
        temp2 = Rx*[PatchData2_X(i,2);PatchData2_Y(i,2);PatchData2_Z(i,2);]
        PatchData2_X(i,1) = temp1(1);
        PatchData2_Y(i,1) = temp1(2);
        PatchData2_Z(i,1) = temp1(3);
        
        PatchData2_X(i,2) = temp2(1);
        PatchData2_Y(i,2) = temp2(2);
        PatchData2_Z(i,2) = temp2(3);
    end
    
    for i=1:4
        for j=1:n_side
            temp = Rx*[PatchData1_X(i,j);PatchData1_Y(i,j);PatchData1_Z(i,j);]
            PatchData1_X(i,j) = temp(1);
            PatchData1_Y(i,j) = temp(2);
            PatchData1_Z(i,j) = temp(3);
        end
    end
    
    % Draw side patches
    obj.armL2V.sides.x =  PatchData1_X + 0.4/2;
    obj.armL2V.sides.y =  PatchData1_Y + 0.4/3;
    obj.armL2V.sides.z =  PatchData1_Z + 0.8;
    obj.armL2p.sides = patch(obj.armL2V.sides.x,obj.armL2V.sides.y,obj.armL2V.sides.z,obj.color);
    
    % Draw bottom patches
    obj.armL2V.topbottom.x =  PatchData2_X + 0.4/2;
    obj.armL2V.topbottom.y =  PatchData2_Y + 0.4/3;
    obj.armL2V.topbottom.z =  PatchData2_Z + 0.8;
    
    obj.armL2p.topbottom = patch(obj.armL2V.topbottom.x,obj.armL2V.topbottom.y,obj.armL2V.topbottom.z,obj.color);
end