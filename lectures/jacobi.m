% Jacobi Method
% 
% Description
% -----------
% Solve the system of equations Ax=b for the unknown x using an iterative 
% method (Jacobi's method).
%
% \param[in] A Matrix of coefficients (may be full or sparse).
% \param[in] b Right-hand side vector.
% \param[in] k Maximum number of iterations of the method.
% \param[out] x Approximate solution.

function x = jacobi(A,b,k)

n=length(b); % find n
D=diag(A); % extract diagonal of A
R=A-diag(D); % r is the remainder (U+L)
x=zeros(n,1); % initialize vector x

% loop for Jacobi iteration
for j=1:k 
  x = (b-R*x)./D
end % End of Jacobi iteration loop