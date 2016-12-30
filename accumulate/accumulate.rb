module Enumerable
  def accumulate
    y = self.class.new
    0.upto(size - 1) { |iter| y.push(yield self[iter]) }
    y
  end
end

module BookKeeping
  VERSION = 1
end
