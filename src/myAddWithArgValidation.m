function out = myAddWithArgValidation(in1, in2) %#codegen
%

%   Copyright 2024 The MathWorks, Inc.

    arguments
        in1 (1, 1) double
        in2 (1, 1) double
    end
    out = in1 + in2;
end