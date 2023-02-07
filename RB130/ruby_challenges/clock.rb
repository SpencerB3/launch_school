require 'minitest/autorun'
require_relative 'clock'

class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hr, min)
    @hours = find_hour(hr)
    @minutes = find_minutes(min)
  end

  def self.at(hr, min = 0)
    new(hr, min)
  end

  def to_s
    format("%02d:%02d", @hours, @minutes)
  end

  def +(num)
    total_minutes = (@hours * MINUTES_PER_HOUR) + @minutes
    total_minutes += num

    new_hours, new_minutes = total_minutes.divmod(60)

    self.class.at(new_hours, new_minutes)
  end

  def -(num)
    total_minutes = (@hours * MINUTES_PER_HOUR) + @minutes
    total_minutes -= num

    new_hours, new_minutes = total_minutes.divmod(60)

    self.class.at(new_hours, new_minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def find_hour(hr)
    hr % HOURS_PER_DAY
  end

  def find_minutes(min)
    min % MINUTES_PER_HOUR
  end
end
