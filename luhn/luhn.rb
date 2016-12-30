class Luhn
  attr_accessor :addends

  def initialize(input)
    @addends = input.to_s.each_char.with_index.collect do |value, idx|
      ((input.to_s.size - idx) % 2).zero? ? increase(value.to_i) : value.to_i
    end
  end

  def increase(value)
    2 * value - value / 5 * 9
  end

  def checksum
    @addends.reduce(&:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def checksum_digit
    -checksum % 10
  end

  def self.create(input)
    input * 10 + new(input * 10).checksum_digit
  end
end
