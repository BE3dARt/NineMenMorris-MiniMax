function b=muehleController1(b,startingPlayer)
%minimal Mühle controller for two human players, I/O via Command Window
%only Phase 1 playable with transition to phase 2
%no muehle checks yet
%inputs:
%  b  (default:empty) specifies a board (3x3x3, 0=empty; 1=mark pl1(white);
%  -1=mark pl2(black); nan=not a valid space)
%  startingPlayer (default:random) specifies which players (1/-1) turn it is


phase1=1;
phase2=1;
stonesBeginningPhase=18;

if ~exist('startingPlayer','var')
    startingPlayer = 1;
    if rand()>0.5; startingPlayer = -1; end
end
if ~exist('b','var') || size(b,1)~=3 || size(b,2)~=3 %create board if nonexistent
    a = zeros(3,3,3); 
    a(2,2,:) = NaN; %NaN at every middle position since muhle has no middle position in each layer
    b=a;
end

playerType = startingPlayer;

while 1 && stonesBeginningPhase>0 
    disp(b);
   
    move = input(['Move of Player ' num2str(playerType) ':  ']);
    stonesBeginningPhase=stonesBeginningPhase-1;
    while ~(isfloat(move) && isscalar(move) && move>0 && move<=27 && b(move)==0)
        disp('Impossible move (must be the linear index of an empty cell). Try again');
        move = input(['Move of Player ' num2str(playerType) ' :  ']);
    end
    
    b(move) = playerType;
    playerType = -playerType;
   
end
disp('end of Phase 1');
phase1=2;
phase2=2;
end
