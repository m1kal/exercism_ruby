class Palindromes
  attr_accessor :largest, :smallest

  def initialize(hash)
    @max_factor = hash[:max_factor] || 1
    @min_factor = hash[:min_factor] || 1
  end

  def generate
    @largest = Palindrome.new(find_max, @min_factor, @max_factor)
    @smallest = Palindrome.new(find_min, @min_factor, @max_factor)
  end

  def find_max
    max = 1
    @min_factor.upto(@max_factor) do |k|
      @min_factor.upto(@max_factor) do |l|
        max = k * l if k * l > max && palindrome(k * l)
      end
    end
    max
  end

  def find_min
    min = @max_factor * @max_factor
    @min_factor.upto(@max_factor) do |k|
      @min_factor.upto(@max_factor) do |l|
        min = k * l if k * l < min && palindrome(k * l)
      end
    end
    min
  end

  def palindrome(val)
    val.to_s.each_char.with_index.all? do |char, idx|
      char == val.to_s.chars[val.to_s.length - idx - 1]
    end
  end
end

class Palindrome
  attr_accessor :value, :factors

  def initialize(value, min, max)
    @value = value
    @factor_limits = [min, max]
    @factors = factorize
  end

  def factorize
    1.upto(Math::sqrt(@value)).reduce([]) do |acc, candidate|
      factor(candidate) ? acc << [candidate, @value / candidate] : acc
    end
  end

  def factor(candidate)
    (@value % candidate).zero? && factors_in_range(candidate)
  end

  def factors_in_range(candidate)
    candidate >= @factor_limits[0] && candidate <= @factor_limits[1] &&
      @value / candidate >= @factor_limits[0] &&
      @value / candidate <= @factor_limits[1]
  end
end
