classdef Robot < Singleton
    properties
        %The data for the model of the robot
        baseV = [];
        baseF = [];
        basep = [];
        
        %Properties of the pose of the robot
        position = [];
        oreintation = 0; %[deg]
        color ='';
        %Properties of the movement of the robot
        speedStep = 0.001;
    end
    
    % PRIVATE ACCESS METHODS
    methods (Access = private)
        function newObj = Robot(pos,color,ori)
            newObj.position = pos;
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
        function obj = translate(obj,dD)
            
            F = dD(1);
            B = dD(2);
            R = dD(3);
            L = dD(4);
            
            theta = obj.oreintation;
            
            dy = F*cos(theta) - B*cos(theta) - R*sin(theta) + L*sin(theta);
            dx = F*sin(theta) - B*sin(theta) + R*cos(theta) - L*cos(theta);
            
            x = obj.position(1) + dx;
            y = obj.position(2) + dy;
            

            while(~(obj.position(2) == y))
                if(~(obj.position(1) == x))
                    obj.position(1) = obj.position(1) + obj.speedStep*dx/abs(dx);
                    obj.baseV(:,1) = obj.baseV(:,1) + obj.speedStep*dx/abs(dx);
                end
                if(~(obj.position(2) == y))
                    obj.position(2) = obj.position(2) + obj.speedStep*dy/abs(dy);
                    obj.baseV(:,2) = obj.baseV(:,2) + obj.speedStep*dy/abs(dy);
                end
                obj
                set(obj.basep,'Vertices',obj.baseV);
                drawnow;
                
            end     
        end
    end
end