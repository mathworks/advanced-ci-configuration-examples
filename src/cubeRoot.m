function cr = cubeRoot(x)
% cubeRoot Compute the cube root of a number.
%   cr = cubeRoot(x) returns the cube root of x. If x is negative, an error
%   is thrown.

if x < 0
    error('CUBEROOT:INVALIDINPUT', 'Negative value %d Not accepted', x);
else
    cr = nthroot(x, 3); % MATLAB's nthroot function can compute any root
end

end