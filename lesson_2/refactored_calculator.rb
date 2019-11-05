require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

OPERATIONS = { 'addition' => '1',
               'subtraction' => '2',
               'multiplication' => '3',
               'division' => '4' }

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
  puts format(messages('number', language), pick_number: first_or_second)
  gets.chomp
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def retrieve_operator(language)
  prompt(messages('operator_request', language))
  gets.chomp
end

def operation_to_message(operator, language)
  case operator
  when '1'
    puts format(messages('addition', language))
  when '2'
    puts format(messages('subtraction', language))
  when '3'
    puts format(messages('multiplication', language))
  when '4'
    puts format(messages('division', language))
  end
end

def calculation(operator, number1, number2)
  case operator
  when '1' then number1.to_i() + number2.to_i()
  when '2' then number1.to_i() - number2.to_i()
  when '3' then number1.to_i() * number2.to_i()
  when '4' then number1.to_f() / number2.to_f()
  end
end

def display_result(result, language)
  puts format(messages('result', language), result: result)
end

def continue?(language)
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
    sleep(2)
    clear
    break
  else
    prompt(messages('invalid_name', language))
  end
end

loop do
  loop do
    if language == 'en'
      number1 = retrieve_number('first', language)
    elsif language == 'es'
      number1 = retrieve_number('primero', language)
    end
    break if valid_number?(number1)
    prompt(messages('invalid_number'))
  end
  clear

  loop do
    if language == 'en'
      number2 = retrieve_number('second', language)
    elsif language == 'es'
      number2 = retrieve_number('segundo', language)
    end
    break if valid_number?(number2)
    prompt(messages('invalid_number'))
  end
  clear

  loop do
    operator = retrieve_operator(language)
    if operator == '4' && number2 == '0'
      prompt(messages('invalid_division', language))
      next
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('invalid_operator'))
    end
  end
  clear

  operation_to_message(operator, language)

  sleep(2)

  result = calculation(operator, number1, number2)

  display_result(result, language)

  if continue?(language)
    clear
  else
    break
  end
end

clear
prompt(format(messages('good_bye', language), name: name))
sleep(3)
clear
