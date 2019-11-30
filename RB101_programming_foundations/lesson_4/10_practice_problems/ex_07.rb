# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

char_count = Hash.new(0)

statement.each_char do |char|
  char_count[char] += 1
end
