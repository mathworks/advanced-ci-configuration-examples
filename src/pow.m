function result = pow(base, exponent)
%POW Raises a base to the power of the exponent.

    % Validate input
    if ~isnumeric(base) || ~isnumeric(exponent)
        error('POW:INVALIDINPUT', 'Inputs must be numeric.');
    end

    % Calculate power
    result = base ^ exponent;
end