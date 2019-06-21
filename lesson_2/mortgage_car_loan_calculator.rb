def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt ("-----------------------")

  prompt("What is the loan amount?")

  amount = nil
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = nil
  loop do

  end

  prompt("What is the loan duration (in years)?")

  years = nil
  loop do

  end

  prompt("Another calculation?")
  answer = gets.chomp()

  break unless answer.downcase().start_with?('y')

end

prompt("Thank you for using the Mortgage Calculator")
prompt("Good bye!")