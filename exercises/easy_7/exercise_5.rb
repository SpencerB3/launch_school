# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(string)
  staggered_string = ''

    need_upper = true
    string.each_char do |char|
      if need_upper
        staggered_string += char.upcase
      else
        staggered_string += char.downcase
      end
      need_upper = !need_upper
    end
    staggered_string

  # string.each_char.with_index do |char, index|
  #   if index.odd?
  #     staggered_string += char.downcase
  #   else
  #     staggered_string += char.upcase
  #   end
  # end
  # staggered_string
end

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
