function out = fcnWithSingleArrays(in)
%   Copyright 2023 The MathWorks, Inc.

if coder.target("MATLAB")
    out = in;
else
    out = in + single(0.05);
end