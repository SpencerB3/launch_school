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
    if years.empty? || years.to_i < 0 || years.to_i == 0
      prompt(MESSAGES['invalid_entry'])
    else
      return years
    end
  end
end

def get_monthly_payment(loan_amount, monthly_interest, months)
  loan_amount.to_f * (monthly_interest /
                     (1 - (1 + monthly_interest)**(-months)))
end

def another_calculation?
  answer = ''

  loop do
    prompt(MESSAGES['yes_no'])
    answer = gets.downcase.chomp
    break if answer == 'y' || answer == 'n'
    prompt(MESSAGES['answer_invalid'])
  end

  answer == 'y'
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

  monthly_payment = get_monthly_payment(loan_amount, monthly_interest, months)

  monthly_payment = monthly_payment.round(2)

  prompt(format(MESSAGES['monthly_dues'], amount: monthly_payment))

  prompt(MESSAGES['another_calculation'])

  break unless another_calculation?

  clear
end

clear
prompt(MESSAGES['good_bye'])
sleep(3)
clear
