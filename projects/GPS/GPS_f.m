% GPS system of equations (equation 4.37 in the book). 
% A zero of this function corresponds to the receiver position (x,y,z) 
% and the time correction d.
%
% \param[in]  p  point p=(x,y,z,d) at which to evaluate this function
% \param[in]  S1=(A1,B1,C1) Position of first satellite (parameter)
% \param[in]  S2=(A2,B2,C2) Position of second satellite (parameter)
% \param[in]  S3=(A3,B3,C3) Position of third satellite (parameter)
% \param[in]  S4=(A4,B4,C4) Position of fourth satellite (parameter)
% \param[in]  T=(t1,t2,t3,t4)  Measured time intervals (parameter)
%
% \param[out] r  Value of the (multidim.) function evaluated at p

function r = GPS_f(p, S1, S2, S3, S4, T)

% speed of light (km/h)
c=299792.458;

x=p(1); y=p(2); z=p(3);   % receiver position
d=p(4);                   % time correction

A1=S1(1); B1=S1(2); C1=S1(3); % position of first satellite
A2=S2(1); B2=S2(2); C2=S2(3); % position of second satellite
A3=S3(1); B3=S3(2); C3=S3(3); % position of third satellite
A4=S4(1); B4=S4(2); C4=S4(3); % position of fourth satellite
t1=T(1); t2=T(2); t3=T(3); t4=T(4); % measured time intervals

r1 = sqrt((x-A1)^2+(y-B1)^2+(z-C1)^2)-c*(t1-d);
r2 = sqrt((x-A2)^2+(y-B2)^2+(z-C2)^2)-c*(t2-d);
r3 = sqrt((x-A3)^2+(y-B3)^2+(z-C3)^2)-c*(t3-d);
r4 = sqrt((x-A4)^2+(y-B4)^2+(z-C4)^2)-c*(t4-d);
r=[r1; r2; r3; r4];