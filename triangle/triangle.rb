class Triangle
  def initialize(input)
    @sizes = input.sort
  end

  def equilateral?
    @sizes.uniq.size == 1 && valid?
  end

  def isosceles?
    @sizes.uniq.size < 3 && valid?
  end

  def valid?
    @sizes[0] > 0 && @sizes[0] + @sizes[1] > @sizes[2]
  end

  def scalene?
    !isosceles? && valid?
  end
end

module BookKeeping
  VERSION = 1
end
