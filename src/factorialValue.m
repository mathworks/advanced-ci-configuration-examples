function result = factorialValue(n)
%FACTORIALVALUE Calculates the factorial of n.

    % Check if the input is a non-negative integer
    if ~isnumeric(n) || n < 0 || floor(n) ~= n
        error('FACTORIALVALUE:INVALIDINPUT', 'Input must be a non-negative integer.');
    end

    % Calculate the factorial
    result = factorial(n);
end