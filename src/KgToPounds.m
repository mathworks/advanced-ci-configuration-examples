function weightInPounds = KgToPounds(weightInKg)

    % Define the multiplier to convert kilograms to pounds
    multiplier = 2.20462262;

    % Call the arrayProduct function
    weightInPounds = arrayProduct(multiplier, weightInKg);

    % Display the result
    disp('Weight in Pounds:');
    disp(weightInPounds);

end