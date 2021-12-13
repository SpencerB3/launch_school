module Displayable
  def pause(num)
    sleep(num)
  end

  def press_enter
    gets
    clear
  end

  def empty_line
    puts ""
  end

  def clear
    system 'clear'
  end

  def pause_and_clear(num)
    pause(num)
    clear
  end
end

module Hand
  def total
    sum = 0
    values = cards.map(&:value)

    values.each do |value|
      sum += value
    end

    values.select { |value| value == 11 }.count.times do
      sum -= 10 if sum > Game::WINNING_NUM
    end

    sum
  end

  def busted?
    total > Game::WINNING_NUM
  end

  def show_hand
    puts "** #{name}'s Hand **"
    cards.each do |card|
      puts card
    end
  end

  def add_card(new_card)
    cards << new_card
  end
end

class Participant
  include Hand
  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = nil
    loop do
      print "Please enter your name: "
      name = gets.chomp.strip
      break unless name.empty? || Dealer::DEALER_NAMES.map(&:downcase)
                                                      .include?(name.downcase)
      invalid_name(name)
    end

    self.name = name
  end

  def show_flop
    show_hand
  end

  def invalid_name(name)
    if name.empty?
      puts "Please enter a value - let's try again..."
    elsif Dealer::DEALER_NAMES.map(&:downcase).include?(name.downcase)
      puts "Looks like #{name} is already taken - let's try again..."
    end
  end
end

class Dealer < Participant
  DEALER_NAMES = ['Tom', 'Jerry', 'Bugs_Bunny', 'Sylvester_the_Cat']

  def set_name
    self.name = DEALER_NAMES.sample
  end

  def show_flop
    puts "** #{name}'s Hand **"
    cards.each.with_index do |card, idx|
      if idx == 1
        puts "???"
      else
        puts card
      end
    end
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    @cards.pop
  end
end

class Card
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  include Comparable
  attr_reader :rank, :suit

  HIGH_CARD_VALUES = { 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    HIGH_CARD_VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Score
  WINS_FOR_MATCH = 3

  attr_accessor :score
  attr_reader :human_name, :computer_name

  def initialize(human_name, computer_name)
    @human_name = human_name
    @computer_name = computer_name
    reset
  end

  def reset
    @score = { human_name => 0, computer_name => 0 }
  end

  def winner?
    score.values.include?(WINS_FOR_MATCH)
  end

  def find_winner(player)
    score[player] == WINS_FOR_MATCH
  end

  def display
    "SCORE #{human_name}: #{score[human_name]}  #{computer_name}: " \
    "#{score[computer_name]}"
  end

  def update(player)
    score[player] += 1
  end
end

class Game
  include Displayable
  RULES = <<-HEREDOC
=======================  HOUSE  RULES  ===============================

The goal of Twenty-One is to try to get as close to 21 as possible,  
without going over.  If you go over 21, it's a "bust" and you lose.

Card values - all of the card values are pretty straightforward.
The numbers 2 through 10 are worth their face value. 
The jack, queen, and king are each worth 10.

The ace will be worth 11 if the sum of the hand is 21.

However if the sum of the hand is over 21, the ace will then be worth 1.

First Player to win %{Score::WINS_FOR_MATCH} games wins the match!
Scores will reset after a player reaches %{Score::WINS_FOR_MATCH} wins.

Press ENTER to continue to the game!
HEREDOC

  WINNING_NUM = 21
  DEALER_POINT_LIMIT = 17
  attr_accessor :deck, :player, :dealer, :score

  def initialize
    clear
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @score = Score.new(player.name, dealer.name)
  end

  def start
    display_welcome_and_rules

    loop do
      deal_first_cards

      player_turn
      if player.busted?
        participant_turn_result
        break unless play_again?
        reset
        next
      end
      clear

      dealer_turn
      if dealer.busted?
        participant_turn_result
        break unless play_again?
        reset
        next
      end

      display_end_sequence
      play_again? ? new_game : break
    end

    display_goodbye_message
  end

  private

  def display_end_sequence
    show_cards
    show_result
    declare_winner if match_winner?
  end

  def participant_turn_result
    show_busted
    declare_winner if match_winner?
  end

  def deal_first_cards
    clear_and_display_dealing
    deal_cards
    show_score
    show_flop
  end

  def display_welcome_and_rules
    display_welcome_message
    pause_and_clear(3)
    show_rules?
    clear
  end

  def match_winner?
    score.winner?
  end

  def declare_winner
    [player.name, dealer.name].each do |player|
      puts "#{player} has won the match!!!" if score.find_winner(player)
    end

    empty_line
    reset_scores
  end

  def reset_scores
    score.reset
  end

  def new_game
    clear
    reset
  end

  def display_welcome_message
    puts "Welcome to Twenty-One, #{player.name}!"
  end

  def show_rules?
    answer = nil
    loop do
      puts "Would you like to see rules of the game? (y/n)"
      answer = gets.chomp.downcase.strip
      break if %w(y yes n no).include?(answer)
      puts "Invalid answer. Must use 'y' or 'n' - let's try again..."
    end

    clear_and_display_rules if answer == 'y' || answer == 'yes'
  end

  def clear_and_display_rules
    clear
    print_rules
    press_enter
  end

  def print_rules
    puts RULES
  end

  def show_score
    puts score.display
    empty_line
  end

  def clear_and_display_dealing
    puts "#{dealer.name} dealing out cards...."
    pause_and_clear(3)
  end

  def display_goodbye_message
    clear
    puts "Thank you for playing Twenty-One - Good bye"
    pause_and_clear(3)
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    empty_line
    dealer.show_flop
    empty_line
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
      puts "Invalid input - must use 'y' or 'n'. Let's try again."
    end

    answer == 'y' || answer == 'yes'
  end

  def show_busted
    clear
    if player.busted?
      player_busted
    elsif dealer.busted?
      dealer_busted
    end

    display_end_of_game
  end

  def player_busted
    puts "Looks like #{player.name} has busted! #{dealer.name} has won!"
    score.update(player.name)
  end

  def dealer_busted
    puts "Looks like #{dealer.name} has busted! #{player.name} has won!"
    score.update(dealer.name)
  end

  def display_end_of_game
    empty_line
    puts "FINAL CARDS!"
    show_cards
    show_score
  end

  def player_turn
    puts "It's #{player.name}'s turn..."

    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = hit_or_stay

      if answer == 's' || answer == 'stay'
        player_stays
        break
      elsif player.busted?
        break
      else
        player_hits
        break if player.busted?
      end
    end
  end

  def player_stays
    puts "#{player.name} stays!"
    pause_and_clear(2)
  end

  def player_hits
    player.add_card(deck.deal_one)
    puts "#{player.name} hits!"
    pause_and_clear(2)
    after_player_hit_display
  end

  def hit_or_stay
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s hit stay).include?(answer)
      puts "Invalid answer; must be 'h' or 's'.  Let's try again..."
    end

    answer
  end

  def after_player_hit_display
    show_score
    player.show_hand
    empty_line
    dealer.show_flop
    empty_line
  end

  def dealer_turn
    print_dealers_turn

    loop do
      show_score
      if dealer.total >= DEALER_POINT_LIMIT && !dealer.busted?
        dealer_stays
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer_hits
        show_flop

        dealer_next_move
      end
    end
  end

  def dealer_next_move
    puts "Press enter to see #{dealer.name}'s next move..."
    press_enter
  end

  def dealer_stays
    puts "#{dealer.name} stays!"
  end

  def dealer_hits
    dealer.add_card(deck.deal_one)
  end

  def print_dealers_turn
    puts "It's #{dealer.name}'s turn..."
    pause_and_clear(2)
  end

  def show_cards
    player.show_hand
    empty_line
    dealer.show_hand
    empty_line
  end

  def show_result
    if player.total > dealer.total
      player_won
    elsif dealer.total > player.total
      dealer_won
    else
      puts "It's a tie!"
    end

    show_updated_score
  end

  def player_won
    puts "#{player.name} has won!"
    score.update(player.name)
  end

  def dealer_won
    puts "#{dealer.name} has won!"
    score.update(dealer.name)
  end

  def show_updated_score
    empty_line
    puts "NEW #{score.display}"
    empty_line
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end

Game.new.start
