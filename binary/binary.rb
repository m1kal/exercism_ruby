class Binary
  attr_reader :value

  def initialize(input)
    unless input.chomp.delete('0').delete('1').empty?
      raise ArgumentError, 'Not a binary'
    end
    @value = 0
    input.reverse.each_char.with_index do |c, idx|
      @value += 2**idx if c == '1'
    end
  end

  alias to_decimal value
end

module BookKeeping
  VERSION = 2
end
