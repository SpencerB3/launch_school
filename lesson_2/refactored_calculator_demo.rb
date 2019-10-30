require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts("\n=> #{message}\n\n")
end

def retrieve_language
  prompt(messages('language'))
  gets.chomp
end

def valid_language?(lang)
  lang == 'en' || lang == 'es'
end

def retrieve_name
  prompt(messages('name'))
  gets.chomp
end

def valid_name?(name)
  !name.empty? && !name.strip.size.zero?
end

def greeting(name)
  puts format(messages('name_greeting'), name: name)
end

def retrieve_number(first_or_second)
  puts format(messages('number'), pick_number: first_or_second )
  gets.chomp
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def retrieve_operator
  prompt(messages('operator_request'))
  gets.chomp
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def display_result(result)
  puts format(messages('result'), result: result)
end

def continue?
  prompt(messages('another_calculation'))
  answer = gets.chomp.downcase
  return true if answer == 'y' || answer == 'yes'
end

name = nil
number1 = nil
number2 = nil
operator = nil
language = nil

# --------------MAIN CODE-----------------

clear
prompt(messages('welcome'))
loop do
  language = retrieve_language
  break if valid_language?(language)
  prompt(messages('invalid_language'))
end

loop do
  name = retrieve_name
  if valid_name?(name)
    greeting(name)
    break
  else
    prompt(messages('invalid_name'))
  end
end

loop do

  loop do
    number1 = retrieve_number('first')
    break if valid_number?(number1)
    prompt(messages('invalid_number'))
  end

  loop do
    number2 = retrieve_number('second')
    break if valid_number?(number2)
    prompt('invalid_number')
  end
  
  loop do
    operator = retrieve_operator
    if operator == '4' && number2 == '0'
      prompt(messages('invalid_division'))
      next
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt('invalid_operator')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end


  display_result(result)

  if continue?
    clear
  else
    break
  end
end

prompt("Thank you for using Calculator, #{name}.  Good-bye!")
sleep(4)
clear
