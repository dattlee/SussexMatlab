% Allocate path data
paths = [paths;zeros(T,2,N_AGENTS)];

% Run simulation
for t=1:T
    
    % Clear plot
    clf; 
    hold on;
    
    % Plot objects,  (They need to be reploted every time step)
    for object = N_AGENTS+[1:N_OBJECTS]
        
        % Get variables
        xo = position(1,object);
        yo = position(2,object);
        
        % Plot object
        c = 1-visibility(:,object)';
        plot(xo,yo,'.','MarkerSize',30,'Color',c);
        plot(xo,yo,'ko','MarkerSize',10);
    end
    
    % Update agents
    for agent = 1:N_AGENTS
        
        % Get variables
        x = position(1,agent);
        y = position(2,agent);
        a = bearing(agent);
        R = radius(agent);
        r = R.^2;
        
        % Record path
        paths((end-T)+t,1,agent) = x;
        paths((end-T)+t,2,agent) = y;
        
        % Plot path
        plot(paths(1:(end-T)+t,1,agent), ...
             paths(1:(end-T)+t,2,agent),'k-')
        
        % Plot body
        c = 1-visibility(:,agent)';
        plot(x,y,'.','Markersize',40,'Color',c);
        plot(x,y,'ko','Markersize',14);
        
        % Clear sensor positions
        sl_pos = zeros(2,3);
        sr_pos = zeros(2,3);
        for sense = 1:3
            
            % Get variables
            b = sensor_angles(sense,agent);
            c = [1,1,1]; c(sense)=0;
            
            % Calculate left sensor position
            sl_pos(1,sense) = x + R.*cosd(a+b);
            sl_pos(2,sense) = y + R.*sind(a+b);
            
            % Calculate right sensor position
            sr_pos(1,sense) = x + R.*cosd(a-b);
            sr_pos(2,sense) = y + R.*sind(a-b);
            
            % Plot left sensor
            plot([x,sl_pos(1,sense)],[y,sl_pos(2,sense)],'k');
            plot(sl_pos(1,sense),sl_pos(2,sense), ...
                '.','Markersize',20,'Color',c);
            
            % Plot right sensor
            plot([x,sr_pos(1,sense)],[y,sr_pos(2,sense)],'k');
            plot(sr_pos(1,sense),sr_pos(2,sense), ...
                '.','Markersize',20,'Color',c);
            
        end
        
        % Reset wheel velocities (zero-momentum)
        vl = 0;
        vr = 0;
        
        % Handle interactions
        for element = find(1:(N_AGENTS+N_OBJECTS)~=agent)
            
            % Get variables
            xe = position(1,element);
            ye = position(2,element);
            
            % Habndle senses
            for sense = 1:3
                
                % Element visibility
                ev = visibility(sense,element);
                
                % Calculate (square) distance to element
                dl = (xe-sl_pos(1,sense)).^2+(ye-sl_pos(2,sense)).^2;
                dr = (xe-sr_pos(1,sense)).^2+(ye-sr_pos(2,sense)).^2;
                
%                 % Handle object interception distances
%                 if dl < r.^2; dl = r.^2; end
%                 if dr < r.^2; dr = r.^2; end
                
                % Calculate local intensity
                il = sensor_gain(sense).*(ev./dl);
                ir = sensor_gain(sense).*(ev./dr);
                
                % Squash sensor intensities
                %il=tanh(il);
                %ir=tanh(ir);
                
                % Calculate motor inputs via weight matrix
                lm = il.*w_ll + ir.*w_rl + bl;
                rm = il.*w_lr + ir.*w_rr + br;
                
                % Scale by motor gains
                vl = vl + motor_gain(sense).*lm;
                vr = vr + motor_gain(sense).*rm;
            end
        end
                
        % Add some noise
        vl = vl+(NOISE.*rand);
        vr = vr+(NOISE.*rand);
        
        % Calculate axial velocity
        vc = (vl+vr)./2;
        da = rad2deg((vr-vl)./(2.*R));
        
        % Update new agent position and bearing
        position(1,agent) = x + DT.*vc.*cosd(a);
        position(2,agent) = y + DT.*vc.*sind(a);
        
        bearing(agent) = mod(a + DT.*da,360);
    end
    
    axis([LIMITS,LIMITS]);
    drawnow
    
end




