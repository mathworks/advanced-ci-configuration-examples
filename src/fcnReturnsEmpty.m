function x = fcnReturnsEmpty() %#codegen
coder.varsize('x',[4,4],[1,1]);
x = zeros(2);
x(:) = [];
end
