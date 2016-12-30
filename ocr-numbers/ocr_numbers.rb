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
    0.upto(@text.size - 1).collect { |group| convert_group(group) }.join(',')
  end

  def convert_group(group)
    0.upto(@text[group].size - 1).collect do |digit|
      (DIGITS.index(@text[group][digit]) || '?').to_s
    end.join
  end

  def find_digit_groups(input)
    lines = input.split("\n")
    0.upto(lines.size / 4 - 1).collect { |group| find_digits(lines, group) }
  end

  def find_digits(lines, group)
    num_digits = lines[0].size / 3
    0.upto(num_digits - 1).collect do |digit|
      0.upto(3).collect { |line| lines[4 * group + line][3 * digit, 3] }.join
    end
  end
end
