clc
clear all
close all
%% Point Coordinates

%Points

initHeight = 1170;
d1 = 70;
d2 = 75;

baseTriangle = [0 0 -650;-635 0 +325;635 0 +325]*0.001;
upInnerTriangle = [0 initHeight+d1 -650+d2;-480 initHeight+d1 +325-d2;480  initHeight+d1 +325-d2]*0.001;
upOuterTriangle = [0  initHeight+d1 -650;-572  initHeight+d1 +325;572  initHeight+d1 +325]*0.001;
% midTriangle2 = [0  1211 650;-579.5  1211 -325;579.5  1211 -325]*0.001;
midTriangle1 = [initHeight/1000*(upOuterTriangle(1,:)-baseTriangle(1,:))/norm(upOuterTriangle(1,:)-baseTriangle(1,:))+baseTriangle(1,:);
    initHeight/1000*(upOuterTriangle(2,:)-baseTriangle(2,:))/norm(upOuterTriangle(1,:)-baseTriangle(1,:))+baseTriangle(2,:);
    initHeight/1000*(upOuterTriangle(3,:)-baseTriangle(3,:))/norm(upOuterTriangle(1,:)-baseTriangle(1,:))+baseTriangle(3,:)];
midTriangle2 = [9/10*(upOuterTriangle(1,:)-baseTriangle(1,:))+baseTriangle(1,:);
    9/10*(upOuterTriangle(2,:)-baseTriangle(2,:))+baseTriangle(2,:);
    9/10*(upOuterTriangle(3,:)-baseTriangle(3,:))+baseTriangle(3,:)];

% Directions
revoluteDir0 = [0 1 0];
revoluteDir1 = [1 0 0;0 0 1;0 0 1];
revoluteDir2 = [1 0 0;0 0 1;0 0 1];
prismaticDir = -[baseTriangle(1,:)-upOuterTriangle(1,:);
    baseTriangle(2,:)-upOuterTriangle(2,:);
    baseTriangle(3,:)-upOuterTriangle(3,:)]*0.001;
revoluteDir3 = [0 0 1;1 0 0;1 0 0];
% revoluteDir4 = [0 1 0;0 1 0;0 1 0];
fVector1 = -[0; 0; -558]*0.001;
fVector2 = -[-480; 0; +325]*0.001;
fVector3 = -[480;  0; +325]*0.001;

bVector1 = [0; 0; -650]*0.001;
bVector2 = [-635; 0; +325]*0.001;
bVector3 = [635; 0; +325]*0.001;

%% Initial Lenghts
t = [0;initHeight*0.001;0];
R = eye(3);
l1_0 = norm(t-R*fVector1-bVector1);
l2_0 = norm(t-R*fVector2-bVector2);
l3_0 = norm(t-R*fVector3-bVector3);

%% Mass Properties
followerMass = 200;
followerMoment = [50 0 0;0 40 0;0 0 18];
baseInertia = [1 0 0;0 100 0;0 0 1];
baseMass = 100;


lowerJackMass = 28;
upperJackMass = 7;
lowerJackInertia = [1 0 0;0 0.01 0;0 0 1];
upperJackInertia = [1 0 0;0 0.01 0;0 0 1];

g = 9.8;
