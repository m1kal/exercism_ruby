class Clock
  def initialize(hour, minute)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def self.at(hour, minute)
    new(hour, minute)
  end

  def to_s
    format('%02d:%02d', @hour, @minute)
  end

  def +(other)
    self.class.new(@hour, @minute + other)
  end

  def ==(other)
    to_s == other.to_s
  end
end

module BookKeeping
  VERSION = 2
end
