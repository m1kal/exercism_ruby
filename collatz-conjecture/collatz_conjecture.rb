class CollatzConjecture
  def self.steps(start)
    raise ArgumentError unless start > 0
    return 0 if start == 1
    1 + steps(start.even? ? start / 2 : 3 * start + 1)
  end
end

module BookKeeping
  VERSION = 1
end
