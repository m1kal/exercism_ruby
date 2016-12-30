class Trinary
  attr_reader :value

  def initialize(input)
    @value = (input. =~ /[^012]/) ? 0 : trinary_decode(input)
  end

  def trinary_decode(input)
    input.reverse.each_char.with_index.collect do |c, idx|
      c.to_i * 3**idx
    end.reduce(&:+)
  end

  alias to_decimal value
end

module BookKeeping
  VERSION = 1
end
