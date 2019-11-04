require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}\n\n")
end

def retrieve_language
  prompt(messages('language'))
  gets.chomp
end

def valid_language?(lang)
  lang == 'en' || lang == 'es'
end

def retrieve_name(language)
  prompt(messages('name', language))
  gets.chomp
end

def valid_name?(name)
  !name.empty? && !name.strip.size.zero?
end

def greeting(name, language)
  puts format(messages('name_greeting', language), name: name)
end

def retrieve_number(first_or_second, language)
  puts format(messages('number', language), pick_number: first_or_second )
  gets.chomp
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def retrieve_operator
  prompt(messages('operator_request', language))
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

def display_result(result, language)
  puts format(messages('result', language), result: result)
end

def continue?
  prompt(messages('another_calculation', language))
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
sleep(2)
clear

loop do
  language = retrieve_language
  break if valid_language?(language)
  prompt(messages('invalid_language'))
end
clear

loop do
  name = retrieve_name(language)
  if valid_name?(name)
    clear
    greeting(name, language)
    sleep(3)
    clear
    break
  else
    prompt(messages('invalid_name', language))
  end
end

loop do

  loop do
    language == 'en' ? number1 = retrieve_number('first', language) : 
                       number1 = retrieve_number('primero', language)
    break if valid_number?(number1)
    prompt(messages('invalid_number'))
  end
  clear

  loop do
    language == 'en' ? number2 = retrieve_number('second', language) : 
                       number2 = retrieve_number('segundo', language)
    break if valid_number?(number2)
    prompt(messages('invalid_number'))
  end
  clear
  
# this where i left off Saturday afternoon - inserting second languaage, yet to fully go through the Naataalia critique

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
  clear

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep(2)

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

clear
prompt("Thank you for using Calculator, #{name}.  Good-bye!")
sleep(3)
clear
