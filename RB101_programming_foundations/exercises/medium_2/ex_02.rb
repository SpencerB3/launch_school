# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:

# a method with a string argument => string
# output: => boolean
# given a collection of two letters,
# each pair can only be used once to spell a word.
# write method whether word as argument can be spelled from this set of bloc

LETTER_BLOCK = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
                 'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
                 'V' => 'I', 'L' => 'Y', 'Z' => 'M' }.freeze

def block_word?(word)
  word = word.upcase
  word.each_char do |char|
    if LETTER_BLOCK.key?(char)
      return false if word.include?(LETTER_BLOCK[char])
    elsif LETTER_BLOCK.value?(char)
      return false if word.include?(LETTER_BLOCK.key(char))
    end
  end
  true
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

#  up_string = string.upcase
#  LETTER_BLOCK.none? { |block| up_string.count(block) >= 2 }
