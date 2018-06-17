function recInit(obj)

    l = 0.4;
    w = l;
    h = 0.4;

    v = [0 0 0; l 0 0; l l 0; 0 l 0;
        l 0 0; l 0 h; l l h; l l 0;
        l l 0; l l h; 0 l h; 0 l 0;
        0 0 0; 0 0 h; 0 l h; 0 l 0;
        0 0 0; l 0 0; l 0 h; 0 0 h;
        0 0 h; l 0 h; l l h; 0 l h];

    v(:,1) = v(:,1) + obj.x - l/2;
    v(:,2) = v(:,2) + obj.y - l/2;
    v(:,3) = v(:,3) + obj.z;

    f = [1 2 3 4;
        5 6 7 8;
        9 10 11 12;
        13 14 15 16;
        17 18 19 20;
        21 22 23 24];

    obj.baseV = v;
    obj.baseF = f;
    obj.basep = patch('Faces',obj.baseF,'Vertices',obj.baseV, ...
        'FaceColor',obj.color);

end