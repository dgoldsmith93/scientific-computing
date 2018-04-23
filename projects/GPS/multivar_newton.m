% Description
% -----------
% Solve the nonlinear system of equations F(x)=0
% for the unknown x using Newton's method.
%
% \param[in]  x0 Initial vector
% \param[in]  k  Maximum number of iterations of the method.
% \param[out] x  Approximate solution.

function x = multivar_newton(x0,k)
x=x0;
% loop for Newton's iteration
for j=1:k
  
  F=F_exercise_1a(x); % Function at x
  DF=DF_exercise_1a(x); % Jacobian at x
  
  % Check that Jacobian matrix is invertible.
  if(rank(DF)<length(x0))
    disp("Jacobian is singular! Exiting.\n")
    return
  endif
  
  % Instead of computing the inverse of the Jacobian, solve the equivalent 
  % linear system
  s=DF\F;
  x=x-s
end % End of iteration loop
