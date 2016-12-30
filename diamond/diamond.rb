class Diamond
  def self.make_diamond(input_letter)
    size = input_letter.ord - 'A'.ord + 1
    upper_half = 'A'.upto(input_letter).collect { |letter| line(letter, size) }
    symmetrize(upper_half).join("\n") + "\n"
  end

  def self.line(letter, size)
    inside_pad = letter.ord - 'A'.ord
    side_pad = size - inside_pad - 1
    symmetrize(' ' * side_pad + letter + ' ' * inside_pad)
  end

  def self.symmetrize(input)
    input + input[0..-2].reverse
  end
end

module Bookkeeping
  VERSION = 1
end
