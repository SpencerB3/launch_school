// Create a function that calculates a person's body mass index (BMI). It should take two parameters: someone's height(in cm) and weight(in kg).The formula for calculating the BMI is as follows: bmi = weight_in_kg / height_in_m ** 2

// Round the result to two decimals.For example:

function calculateBMI(height_in_cm, weight_in_kg) {
  let height_in_m = height_in_cm / 100
  let bmi = weight_in_kg / height_in_m ** 2
  return bmi.toFixed(2);
}

calculateBMI(180, 80); // 24.69
