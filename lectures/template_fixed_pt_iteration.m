% PLOTTING EXAMPLE
%
% fixed_pt_iteration(x1, y, n, fname)
%
% Solve the equation x*exp(x) = y by the fixed-point iteration
%   x(i+1) = log(y) - log(x(i));
% and plot the convergence of the residual |x+log(x)-log(y)| to zero.
%
% Inputs:
%   x1    - Initial guess (default: 1)
%   y     - Right side (default: 10)
%   n     - Maximum number of iterations (default: 60)
%   fname - Name of an eps file for printing the convergence plot.

function fixed_pt_iteration(x, y, n, fname)

  % Set default parameter values
  if nargin < 1, x = 1; end
  if nargin < 2, y = 10; end
  if nargin < 3, n = 60; end
  
  % Compute the iterates
  for i = 1:n-1
    x(i+1) = log(y) - log(x(i));
  end
  
  % Plot the residual error vs iteration number on a log scale 
  % using the command semilogy.
  f = x + log(x) - log(y);
  % ...
  
  % Label the x and y axes
  % ...
  
  % Add a title. The sprintf command lets us format the string.
  % ...
  grid; % A grid makes the plot easier to read
  
  % If a filename is provided, print to that file 
  % using the command print.
  % ...
  end