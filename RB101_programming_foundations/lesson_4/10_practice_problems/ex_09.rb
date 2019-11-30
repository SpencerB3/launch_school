# Write your own version of the rails titleize implementation.

words = "the flintstones rock"

cap_words = words.split.map { |word| word.capitalize }.join(' ')
