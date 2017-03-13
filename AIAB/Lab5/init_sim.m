clear             % Empty global memory

T  = 100;         % Simulation time per run
DT = 0.05;        % Integration time-step

% Parameters
N_AGENTS  = 1;    % Number of agents
N_OBJECTS = 2;    % Number of objects
NOISE     = 0.1;  % External perterbation


% Agent morphology
visibility    = [ 1.0  .* zeros(3,N_AGENTS), ...
                 1.0  .* ones(3,N_OBJECTS)];
radius        =   0.05 .* ones(1,N_AGENTS);
sensor_angles =   45.0 .* ones(3,N_AGENTS);

% Sensor and motor gains
sensor_gain   =   0.1  .* ones(3,N_AGENTS);
motor_gain    =   0.5  .* ones(3,N_AGENTS);

% Initial setup
position      = [ -1   .* (ones(2,N_AGENTS)-0.5), ...
                 0.* (ones(2,N_OBJECTS)-0.5)];
bearing       =  0; (rand * 45 + rand * 45)  .* rand(1,N_AGENTS);

% Plot limits
LIMITS   = [-1,1];

% Set up figure
paths=[];
fig=figure(1);
set(fig,'Color',[1 1 1])
clf; hold on;

% Plot objects
for object = N_AGENTS+[1:N_OBJECTS]

% Get variables
xo = position(1,object);
yo = position(2,object);

% Plot object
c = 1-visibility(:,object)';
plot(xo,yo,'.','MarkerSize',30,'Color',c);
plot(xo,yo,'ko','MarkerSize',10);
end

% Plot agents
for agent = 1:N_AGENTS

% Get variables
x = position(1,agent);
y = position(2,agent);
a = bearing(agent);
R = radius(agent);

% Plot body
c = 1-visibility(:,agent)';
plot(x,y,'g.','Markersize',40,'Color',c);
plot(x,y,'ko','Markersize',14);

% Plot sensors
for sense = 1:3

% Get variables
b = sensor_angles(sense,agent);
c = [1,1,1]; c(sense)=0;

% Calculate left sensor position
sl_x = x + R.*cosd(a+b);
sl_y = y + R.*sind(a+b);

% Calculate right sensor position
sr_x = x + R.*cosd(a-b);
sr_y = y + R.*sind(a-b);

% Plot left sensor
plot([x,sl_x],[y,sl_y],'k');
plot(sl_x,sl_y,'.','Markersize',20,'Color',c);

% Plot right sensor
plot([x,sr_x],[y,sr_y],'k');
plot(sr_x,sr_y,'.','Markersize',20,'Color',c);

end
end

axis([LIMITS,LIMITS]);
drawnow

% Initialise control weights randomly
ipsi = -1.5;sign(rand-0.5) * (1 + rand);
contra = 0 ; sign(rand-0.5) * (1 + rand);
bias = rand / 2 + 0.1;

w_ll = ipsi + (rand / 5 - 0.1);
w_lr = 0;contra + (rand / 5 - 0.1);
bl = bias;
w_rl = 0;contra + (rand / 5 - 0.1);
w_rr = ipsi + (rand / 5 - 0.1);
br = bias;

% create rad2deg function
rad2deg = @(x) x.*180./pi;