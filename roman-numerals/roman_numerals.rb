module Numerus
  RADIX_ROMANA = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }

  FIGERE_REGULAS = {
    'VIV' => 'IX',
    'LXL' => 'XC',
    'DCD' => 'CM'
  }

  def to_roman
    fix_nines(fix_repetitions(to_naive_roman))
  end

  def to_naive_roman
    expr = ''
    RADIX_ROMANA.each do |key, value|
      next if self < key
      expr << value + (self - key).to_naive_roman
      break
    end
    expr
  end

  def fix_four(input)
    input + RADIX_ROMANA.values[RADIX_ROMANA.values.find_index(input) - 1]
  end

  def fix_repetitions(input)
    input.gsub(/(.)\1{3}/) { |char| fix_four(char[0]) }
  end

  def fix_nines(input)
    FIGERE_REGULAS.reduce(input) do |result, (key, val)|
      result.gsub(Regexp.new(key), val)
    end
  end
end

class Integer
  include Numerus
end

module BookKeeping
  VERSION = 2
end
