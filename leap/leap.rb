class Year
  def self.leap?(year)
    (multiple_of(year, 4) && !multiple_of(year, 100)) || multiple_of(year, 400)
  end

  def self.multiple_of(year, div)
    (year % div).zero?
  end
end

module BookKeeping
  VERSION = 2
end

