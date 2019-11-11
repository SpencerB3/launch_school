# Question 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens.

# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

text = 'The Flintstones Rock!'

i = 0
while i < 10
  puts text
  text.prepend(' ')
  i += 1
end

# LS answer below

10.times { |number| puts (' ' * number) + 'The Flintstones Rock!' }
