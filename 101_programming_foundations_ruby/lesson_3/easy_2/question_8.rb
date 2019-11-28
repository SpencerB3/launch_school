# Shorten this sentence:  ...remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))

p advice

# As a bonus, what happens if you use the String#slice method instead?

# => the string object would remain unmodified 
# => "Few things in life are as important as house training your pet dinosaur."
