% Bisection Method
% 
% Description
% -----------
% Find a root x of the function f.
%
% The function f is assumed to be continuous, and the 
% initial interval [a,b] is assumed to bracket a root, 
% i.e. f(a)f(b)<0.
%
% \param[in] f Funtion handle.
% \param[in] a,b Endpoints of the initial interval, satisfying f(a)f(b)<0.
% \param[in] tol Tolerance for the solution.
% \param[out] xc Approximate solution (root).

function xc = bisect(f,a,b,tol)
if a>b
  error('a<b not satisfied!')        %ceases execution
end
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
while (b-a)/2>tol
  c=(a+b)/2;
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;fb=fc;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
end
xc=(a+b)/2;               %new midpoint is best estimate
