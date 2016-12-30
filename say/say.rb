class Say
  ZERO_TO_NINETEEN = %w(zero one two three four five six seven eight nine
                        ten eleven twelve thirteen fourteen fifteen
                        sixteen seventeen eighteen nineteen).freeze
  TENS = %w(twenty thirty forty fifty sixty seventy eighty ninety).freeze
  ORDERS = %w(thousand million billion).freeze

  def initialize(number)
    raise ArgumentError unless input_valid(number)
    @number = number
  end

  def in_english
    if @number < 20
      ZERO_TO_NINETEEN[@number]
    elsif @number < 100
      tens
    elsif @number < 1000
      hundreds
    else
      big_numbers
    end
  end

  def tens
    TENS[@number / 10 - 2] +
      least_significant_digits(10, '-')
  end

  def hundreds
    self.class.new(@number / 100).in_english +
      ' hundred' + least_significant_digits(100, ' ')
  end

  def big_numbers
    self.class.new(@number / 1000**nearest_order).in_english + ' ' +
      ORDERS[nearest_order - 1] +
      least_significant_digits(1000**nearest_order, ' ')
  end

  def least_significant_digits(base, separator)
    if (@number % base).zero?
      ''
    else
      separator + self.class.new(@number % base).in_english
    end
  end

  def nearest_order
    Math::log10(@number).floor / 3
  end

  def input_valid(number)
    number.is_a?(Numeric) && number >= 0 && number < 10**12
  end

  private :tens, :hundreds, :big_numbers,
          :least_significant_digits, :nearest_order, :input_valid
end
