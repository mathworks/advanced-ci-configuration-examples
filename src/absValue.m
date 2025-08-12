function result = absValue(x)
%ABSVALUE Returns the absolute value of x.

    % Check if the input is numeric
    if ~isnumeric(x)
        error('ABSVALUE:INVALIDINPUT', 'Input must be numeric.');
    end

    % Calculate the absolute value
    result = abs(x);
end