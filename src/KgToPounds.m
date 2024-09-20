% Define the multiplier and the input matrix
multiplier = 2.20462262;
weightInKg = [1, 2, 3, 4, 5];

% Call the arrayProduct function
weightInPounds = arrayProduct(multiplier, weightInKg);

% Display the result
disp('Weight in Pounds:');
disp(weightInPounds);