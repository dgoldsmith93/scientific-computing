% f(theta)
% 
% Description
% -----------
% Function f in a single unknown theta given in the book [Sauer], p. 68.
% The roots f(theta)=0 of this auxiliary function are solutions to the direct 
% kinematics problem of the planar Stewart platform. 
%
% The parameters L_1 , L_2 , L_3 , gamma , x_1 , x_2 , y_2 are fixed
% constants, and the strut lengths p_1 , p_2 , p_3 will be known for a given 
% pose.
%
% \param[in] theta 
%    Argument at which f(theta) is to be evaluated (the angle between the 
%    platform and the x-axis).
% \param[out] out 
%    Result of evaluating f(theta).

% Inputs: theta (the angle between the platform and the x-axis)
function out = f(theta)

p1=                 % length of the three struts          
p2=        
p3=        

L1 =                % the length of side one of the platform connecting struts 2 and 3                                               
L2 =                % the length of the side of the platform connecting struts 1 and 3
L3 =                % the length of the side of the platform connecting struts 1 and 2 

gam =               % the angle between sides L2 and L3                                                                              

                    % the strut p1 is assumed to be at coordinates (0, 0)
x1 =                % the x coordinate where p2 connects to the x axis
                    % p2 is assumed to be anchored to the x axis
x2 =                % the x coordinate of p3's anchor                                                                         
y2 =                % the y coordinate of p3's anchor                                                                                                                                     

% ...

out = N1.^2+N2.^2-p1.^2.*D.^2;