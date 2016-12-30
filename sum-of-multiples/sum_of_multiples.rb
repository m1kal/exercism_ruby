class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    @numbers.collect { |val| multiples(val, limit) }.flatten.uniq.reduce(0, :+)
  end

  def multiples(val, limit)
    1.upto((limit - 1) / val).collect { |factor| val * factor }
  end
end
