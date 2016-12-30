class Hexadecimal
  attr_accessor :value

  HEX_DIGITS = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)
  HEX_BASE = HEX_DIGITS.size

  def initialize(value)
    @value = validate_input(value.upcase)
  end

  def to_decimal
    @value.each_char.with_index.reduce(0) do |decimal, (char, idx)|
      decimal + HEX_DIGITS.index(char) * HEX_BASE**(@value.size - idx - 1)
    end
  end

  def validate_input(input)
    input =~ Regexp.new("^[#{HEX_DIGITS.join}]*$") ? input : '0'
  end

  private :validate_input
end
