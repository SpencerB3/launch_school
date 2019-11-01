require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts "#{message}\n"
end

def clear
  system('clear') || system('cls')
end

def retrieve_amount
  loop do
    prompt(MESSAGES['loan_amount'])
    amount = gets.chomp
    if amount.empty? || amount.to_f <= 0
      prompt(MESSAGES['invalid_entry'])
    else
      return amount
    end
  end
end

def retrieve_interest_rate
  loop do
    prompt(MESSAGES['interest_rate'])
    interest_rate = gets.chomp
    if interest_rate.empty? || interest_rate.to_i <= 0
      prompt(MESSAGES['invalid_entry'])
    else
      return interest_rate
    end
  end
end

def retrieve_loan_duration
  loop do
    prompt(MESSAGES['loan_duration'])
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt(MESSAGES['invalid_entry'])
    else
      return years
    end
  end
end

def retrieve_answer
  loop do
    prompt(MESSAGES['yes_no'])
    answer = gets.chomp
    if answer == 'y' || answer == 'n'
      return answer
    else
      prompt(MESSAGES['answer_invalid'])
    end
  end
end

clear
prompt(MESSAGES['welcome'])
sleep(2)
clear

# --------------MAIN BODY-----------------------
loop do
  loan_amount = retrieve_amount
  clear

  interest_rate = retrieve_interest_rate
  clear

  loan_duration = retrieve_loan_duration
  clear

  yearly_interest = interest_rate.to_f / 100
  monthly_interest = yearly_interest / 12

  months = loan_duration.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-months)))

  monthly_payment = monthly_payment.round(2)

  prompt(format(MESSAGES['monthly_dues'], amount: monthly_payment))

  prompt(MESSAGES['another_calculation'])

  answer = retrieve_answer
  break if answer.downcase == 'n'

  clear
end

clear
prompt(MESSAGES['good_bye'])
sleep(3)
clear
