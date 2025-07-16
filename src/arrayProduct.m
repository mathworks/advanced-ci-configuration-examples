function result = arrayProduct(multiplier, array)
    % Check number of inputs
    if nargin ~= 2
        error("ArrayProduct:TwoInputsRequired", "Function requires exactly two inputs.");
    end

    % Validate first input: must be a scalar
    if ~isscalar(multiplier) || ~isnumeric(multiplier)
        error("ArrayProduct:NotScalar", "First input must be a numeric scalar.");
    end

    % Validate second input: must be a numeric row vector
    if ~isnumeric(array)
        error("ArrayProduct:NotDouble", "Second input must be a numeric vector.");
    end

    if ~isrow(array)
        error("ArrayProduct:NotRowVector", "Second input must be a row vector.");
    end

    % Perform the element-wise multiplication
    result = multiplier .* array;
end
