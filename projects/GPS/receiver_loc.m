% Solve GPS system of equations (equation 4.37 in the book) via the quadratic 
% formula. 
%
% The system has at most two real solutions. We return the only solution 
% that is located on the surface of the Earth. 
% The solution corresponds to the receiver position (x,y,z) 
% and the time correction d.
%
% \param[in]  S1=(A1,B1,C1)    Position of first satellite
% \param[in]  S2=(A2,B2,C2)    Position of second satellite
% \param[in]  S3=(A3,B3,C3)    Position of third satellite
% \param[in]  S4=(A4,B4,C4)    Position of fourth satellite
% \param[in]  T=(t1,t2,t3,t4)  Measured time intervals from the satellite 
%    to the receiver
%
% \param[out] pos=(x,y,z) Receiver position
% \param[out] d           Time correction

function [pos, d] = receiver_loc(S1,S2,S3,S4,T)

C=299792.458; % speed of light (km/s)

A1=S1(1); B1=S1(2); C1=S1(3); % Position of first satellite
A2=S2(1); B2=S2(2); C2=S2(3); % Position of second satellite
A3=S3(1); B3=S3(2); C3=S3(3); % Position of third satellite
A4=S4(1); B4=S4(2); C4=S4(3); % Position of fourth satellite

% Measured time intervals from the satellite to the receiver
t1=T(1); t2=T(2); t3=T(3); t4=T(4);

x1=A2-A1; x2=A3-A1; x3=A4-A1; % Components of the vector u_x
y1=B2-B1; y2=B3-B1; y3=B4-B1; % Components of the vector u_y
z1=C2-C1; z2=C3-C1; z3=C4-C1; % Components of the vector u_z
d1=t1-t2; d2=t1-t3; d3=t1-t4; % Components of the vector u_d

A1B1C1=A1*A1+B1*B1+C1*C1;
A2B2C2=A2*A2+B2*B2+C2*C2;
A3B3C3=A3*A3+B3*B3+C3*C3;
A4B4C4=A4*A4+B4*B4+C4*C4;
csq=C*C;
t1sq=t1*t1;
t2sq=t2*t2;
t3sq=t3*t3;
t4sq=t4*t4;

% Components of the vector w
w1=A1B1C1-A2B2C2-csq*(t1sq-t2sq);
w2=A1B1C1-A3B3C3-csq*(t1sq-t3sq);
w3=A1B1C1-A4B4C4-csq*(t1sq-t4sq);

% 3x3 Determinants
y2z3=y2*z3-y3*z2; y1z3=y1*z3-y3*z1; y1z2=y1*z2-y2*z1;
D1=8*(x1*y2z3-x2*y1z3+x3*y1z2);
D2=8*csq*(d1*y2z3-d2*y1z3+d3*y1z2);
D3=4*(w1*y2z3-w2*y1z3+w3*y1z2);

x2z3=x2*z3-x3*z2; x1z3=x1*z3-x3*z1; x1z2=x1*z2-x2*z1;
E1=8*(y1*x2z3-y2*x1z3+y3*x1z2);
E2=8*csq*(d1*x2z3-d2*x1z3+d3*x1z2);
E3=4*(w1*x2z3-w2*x1z3+w3*x1z2);

x2y3=x2*y3-x3*y2; x1y3=x1*y3-x3*y1; x1y2=x1*y2-x2*y1;
F1=8*(z1*x2y3-z2*x1y3+z3*x1y2);
F2=8*csq*(d1*x2y3-d2*x1y3+d3*x1y2);
F3=4*(w1*x2y3-w2*x1y3+w3*x1y2);

D2t=D2/D1; D3t=D3/D1;
E2t=E2/E1; E3t=E3/E1;
F2t=F2/F1; F3t=F3/F1;

a1=D3t+A1;
b1=E3t+B1;
c1=F3t+C1;

% Solve quadratic equation in the unknown d 
% by calling Octave's "roots" function
coefs=[D2t*D2t+E2t*E2t+F2t*F2t-csq, ...
   2*D2t*a1+2*E2t*b1+2*F2t*c1+2*csq*t1, ...
   a1*a1+b1*b1+c1*c1-csq*t1sq];
d=roots(coefs); 
d1=d(1); d2=d(2);

% Substitute d in the expressions for x,y,z to obtain position of receiver

% p1=(x,y,z) First possible solution
p1(1)=-(D2t*d1+D3t); p1(2)=-(E2t*d1+E3t); p1(3)=-(F2t*d1+F3t);

% p2=(x,y,z) Second possible solution
p2(1)=-(D2t*d2+D3t); p2(2)=-(E2t*d2+E3t); p2(3)=-(F2t*d2+F3t);

% Check which of the two solutions is on the surface of Earth
% (radius 6370 km) and return it.
discrepancy1 = norm(p1,2) - 6370;
discrepancy2 = norm(p2,2) - 6370;
if(discrepancy1<discrepancy2) 
  pos=p1; d=d1; 
else
  pos=p2; d=d2; 
endif