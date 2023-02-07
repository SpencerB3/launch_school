class Robot
  attr_reader :name

  @@names = []

  def initialize
    @name = generate_name
  end

  def reset
    @name = generate_name
  end

  private

  def generate_name
    n = make_name

    @@names << n
    @@names.count(n) == 2 ? generate_name : n
  end

  def make_name
    name = ''
    2.times { name << ('A'..'Z').to_a.sample }
    3.times { name << ('0'..'9').to_a.sample }
    name
  end
end
