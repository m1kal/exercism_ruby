class OcrNumbers
  DIGITS = [
    [[' _ '], ['| |'], ['|_|'], ['   ']].join,
    [['   '], ['  |'], ['  |'], ['   ']].join,
    [[' _ '], [' _|'], ['|_ '], ['   ']].join,
    [[' _ '], [' _|'], [' _|'], ['   ']].join,
    [['   '], ['|_|'], ['  |'], ['   ']].join,
    [[' _ '], ['|_ '], [' _|'], ['   ']].join,
    [[' _ '], ['|_ '], ['|_|'], ['   ']].join,
    [[' _ '], ['  |'], ['  |'], ['   ']].join,
    [[' _ '], ['|_|'], ['|_|'], ['   ']].join,
    [[' _ '], ['|_|'], [' _|'], ['   ']].join
  ].freeze

  def self.convert(input)
    find_digit_groups(input).collect { |group| convert_group(group) }.join(',')
  end

  def self.convert_group(group)
    group.collect { |digit| convert_digit(digit) }.join
  end

  def self.convert_digit(digit)
    raise ArgumentError unless digit.length == 12
    (DIGITS.index(digit) || '?').to_s
  end

  def self.find_digit_groups(input)
    input.split("\n").each_slice(4).collect { |group| find_digits(group) }
  end

  def self.find_digits(lines)
    raise ArgumentError unless (lines.size % 4).zero?
    lines.map { |line| line.split('') }
         .transpose
         .each_slice(3)
         .collect { |tr_digit| tr_digit.transpose.map(&:join).join }
  end
end

module BookKeeping
  VERSION = 1
end
