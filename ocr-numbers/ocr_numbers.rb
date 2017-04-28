class OCR
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

  def initialize(input)
    @text = find_digit_groups(input)
  end

  def convert
    @text.collect { |group| convert_group(group) }.join(',')
  end

  private

  def convert_group(group)
    group.collect { |digit| (DIGITS.index(digit) || '?').to_s }.join
  end

  def find_digit_groups(input)
    input.split("\n").each_slice(4).collect { |group| find_digits(group) }
  end

  def find_digits(lines)
    lines.map { |line| line.split('') }
         .transpose
         .each_slice(3)
         .collect { |tr_digit| tr_digit.transpose.map(&:join).join }
  end
end

class OcrNumbers
  def self.convert(input)
    OCR.new(input).convert
  end
end

module BookKeeping
  VERSION = 1
end
