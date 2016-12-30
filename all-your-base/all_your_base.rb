class BaseConverter
  def self.convert(input_base, digits, output_base)
    return nil if errors_found(input_base, digits, output_base)
    return [] if digits.empty?
    to_base(from_base(digits, input_base), output_base)
  end

  def self.from_base(digits, input_base)
    0.upto(digits.length - 1).reduce(0) do |acc, digit|
      acc + digits.reverse[digit] * input_base**digit
    end
  end

  def self.to_base(value, output_base)
    num_digits = [1, (Math::log(value) / Math::log(output_base)) + 1].max.floor
    rest = value
    0.upto(num_digits - 1).collect do
      digit = rest % output_base
      rest = (rest - digit) / output_base
      digit
    end.reverse
  end

  def self.errors_found(input_base, digits, output_base)
    input_base < 2 || output_base < 2 ||
      digits.any? { |digit| digit < 0 || digit >= input_base }
  end
end

module BookKeeping
  VERSION = 1
end
