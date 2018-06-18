classdef Robot < Singleton
    properties
        %The data for the model of the robot
        baseV = [];
        baseF = [];
        basep = [];
        
        %Properties of the pose of the robot
        x=0;
        y=0;
        z=0;
        oreintation = 0; %[deg]
        color ='';
        %Properties of the movement of the robot
        speedStep = 0.001;
        rotationStep = 0.1;
    end
    
    % PRIVATE ACCESS METHODS
    methods (Access = private)
        function newObj = Robot(pos,color,ori)
            newObj.x = pos(1);
            newObj.y = pos(2);
            newObj.z = pos(3);
            newObj.color = color;
            newObj.oreintation = ori;
            
            initGraphics(newObj);
        end
        
        function initGraphics(obj)
            %set the properties of the figure being used
            recInit(obj);
        end
        
    end
    
    % PUBLIC ACCESS METHODS
    % static
    
    % NOTE: The below method was commented out to allow for multiple
    % instances
    methods(Static)
        % instanciates a RSobot object
        function obj = instance(pos,color,ori)
            %             persistent uniqueInstance
            %             if isempty(uniqueInstance) || ~isvalid(uniqueInstance)
            obj = Robot(pos,color, ori);
            %                 uniqueInstance = obj;
            %             else
            %                 obj = uniqueInstance;
            %             end
        end
    end
    
    % non-static
    methods      
        function obj = rotate(obj,theta)
            
            dt = obj.rotationStep*theta/abs(theta)
            steps = abs(theta)/abs(dt)
            
            for i=1:steps
                tempx = obj.baseV(:,1) - obj.x;
                tempy = obj.baseV(:,2) - obj.y;
                
                temp = zeros(size(obj.baseV));
                
                R = [cosd(dt) sind(dt) 0;
                    -sind(dt) cosd(dt) 0;
                    0 0 1];
                
                for i = 1:length(obj.baseV(:,1))
                    temp(i,1:3) = (R*[tempx(i); tempy(i); 1])';
                end
                
                obj.baseV(:,1:2) = temp(:,1:2);
                obj.baseV(:,1:2) = temp(:,1:2);
                
                obj.baseV(:,1) = obj.baseV(:,1) + obj.x;
                obj.baseV(:,2) = obj.baseV(:,2) + obj.y;
                obj.oreintation = obj.oreintation + dt;
                set(obj.basep,'Vertices',obj.baseV);
                drawnow;
            end
        end
        
        function obj = translate(obj,dD)
            
            F = dD(1); % fowrad motion jets
            B = dD(2); % backward motion jets
            R = dD(3); % right motion jets
            L = dD(4); % left motion jets
            
            % current bering of robot NOTE CURRNETLY NOT IMPLEMENTED
            theta = obj.oreintation
            sp =obj.speedStep;
            
          
            
            % computing the change in position on each axis
            dy = F*cosd(theta) - B*cosd(theta) - R*sind(theta) + L*sind(theta);
            dx = F*sind(theta) - B*sind(theta) + R*cosd(theta) - L*cosd(theta);
            
            %t = atan2(dy,dx);
            
            hyp = sqrt(dy^2 + dx^2);
            
            normdy = dy/hyp;
            
            normdx = dx/hyp;
            
            % computing the goal posision at end of motion
            xg = round((obj.x + dx)*10^5)/10^5
            yg = round((obj.y + dy)*10^5)/10^5
            
            % updating position and object image in figure in steps of 0.01
            % ERROR HERE
            
            obj.y = round(obj.y * 10^5) / 10^5;
            obj.x = round(obj.x * 10^5) / 10^5;
            
            
            ubxg = round((xg + 0.001)*10^5)/10^5;
            lbxg = round((xg - 0.001)*10^5)/10^5;
            
            ubyg = round((yg + 0.001)*10^5)/10^5;
            lbyg = round((yg - 0.001)*10^5)/10^5;
            
            while((obj.x < lbxg || obj.x > ubxg) || (obj.y < lbyg || obj.y > ubyg))
                
                if(obj.x < lbxg || obj.x > ubxg)
                    % move the robot in the x direction
                    obj.x = obj.x + sp*(normdx);
                    obj.baseV(:,1) = obj.baseV(:,1) + sp*(normdx);
                end
                if(obj.y < lbyg || obj.y > ubyg)
                    % move the robot in the y direction
                    obj.y = obj.y + sp*(normdy);
                    obj.baseV(:,2) = obj.baseV(:,2)+ sp*(normdy);
                end
                obj.y = round(obj.y * 10^5) / 10^5;
                obj.x = round(obj.x * 10^5) / 10^5;
                
                % update figure
                set(obj.basep,'Vertices',obj.baseV);
                drawnow;
            end
        end
    end
end