% Test the receiver_loc function by re-solving activity1, 
% and checking that we obtain the correct answer 
% (x, y, z) = (−41.77271, −16.78919, 6370.0596), and
% d = −3.201566 * 10^{−3} seconds.

S1=[15600, 7540, 20140];
S2=[18760, 2750, 18610];
S3=[17610, 14630, 13480];
S4=[19170, 610, 18390];
T=[0.07074, 0.07220, 0.07690, 0.07242];
[pos, d]=receiver_loc(S1,S2,S3,S4,T)