% Fixed-Point Iteration
% 
% Description
% -----------
% Computes approximate solution of g(x)=x.
%
% The function g is assumed to be continuous.
%
% \param[in] g   Funtion handle.
% \param[in] x0  Initial guess of the fixed point.
% \param[in] tol Tolerance for the solution.
% \param[in] k   Maximum number of steps.
% \param[out] xc Approximate solution (fixed point).
%
% This version will stop once the error criterion is met. 
% We use absolute error but could use relative error for large magnitude 
% answers.
%
% If you also want to know the number of iterations, 
% change the output structure to include i as well:
% function [xc i]=fpi(g,x0,tol,k)
% The rest is the same

function xc=fpi(g,x0,tol,k)
x(1)=x0;
for i=1:k
  x(i+1)=g(x(i));
  abserr=abs(x(i+1)-x(i));
  if (abserr<tol)
    break % jump out the loop; we are done
  end
  printf("x(%d)=%f\n", i, x(i+1));
end
if (i==k)
  disp('The algorithm did not converge')
end
xc=x(i+1);
