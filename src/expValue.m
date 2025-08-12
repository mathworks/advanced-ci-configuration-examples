function result = expValue(x)
%EXPVALUE Returns the exponential of x (e^x).

    % Check if the input is numeric
    if ~isnumeric(x)
        error('EXPVALUE:INVALIDINPUT', 'Input must be numeric.');
    end

    % Calculate the exponential
    result = exp(x);
end