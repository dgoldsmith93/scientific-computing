% Nested multiplication (a.k.a. Horner's method)
% 
% Description
% -----------
% Evaluate a polynomial P(x) of degree n at a given point x.
%
% The polynomial 
%   P(x)=c_n x^n + c_{n-1} x^{n-1} +  ... + c_1 x + c_0
% is represented as an array of n+1 coefficients c=(c_0, c_1, ..., c_n).
%
% \param[in] n Degree of the polynomial.
% \param[in] c Coefficients of the polynomial.
% \param[in] x Point at which P(x) is to be evaluated.
% \param[out] y Result.

function y=nested(n, c, x)
y=c(n+1);
for i=n:-1:1
  y=c(i)+x.*y;
end