class RotationalCipher
  def self.rotate(input, number)
    input.each_char.map { |char| rotate_char(char, number) }.join('')
  end

  def self.rotate_char(input, number)
    RotationalCipherCharacter.new(input).rotate(number)
  end
end

class RotationalCipherCharacter
  def initialize(input)
    @char = input
    @offset = input == input.upcase ? 'A' : 'a'
  end

  def rotate(number)
    @char =~ /[a-zA-Z]/ ? shift(number) : @char
  end

  def shift(number)
    (@offset.ord + (@char.ord - @offset.ord + number) % 26).chr
  end
end

module BookKeeping
  VERSION = 1
end
