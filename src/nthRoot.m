function nr = nthRoot(x, n)
% nthRoot Compute the nth root of a number.
%   nr = nthRoot(x, n) returns the nth root of x. If x is negative and n
%   is even, an error is thrown.

if x < 0 && mod(n, 2) == 0
    error('NTHROOT:INVALIDINPUT', 'Negative value %d Not accepted for even root %d', x, n);
else
    nr = nthroot(x, n);
end

end