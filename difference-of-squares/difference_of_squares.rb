class Squares
  attr_reader :square_of_sum, :sum_of_squares

  def initialize(limit)
    @square_of_sum = 0.upto(limit).reduce(:+)**2
    @sum_of_squares = 0.upto(limit).map { |x| x**2 }.reduce(:+)
  end

  def difference
    @square_of_sum - @sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
