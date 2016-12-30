class Series < String
  def initialize(input)
    raise ArgumentError, 'Invalid characters' if input =~ /\D/
    super(input)
  end

  def largest_product(digits)
    raise ArgumentError, 'Incorrect value' if digits > length || digits < 0
    product = 0
    0.upto(length - digits) do |idx|
      if digit_product(self[idx, digits]) > product
        product = digit_product(self[idx, digits])
      end
    end
    product
  end

  def digit_product(string)
    string.each_char.collect(&:to_i).reduce(1, &:*)
  end
end

module BookKeeping
  VERSION = 2
end
