class Sieve
  attr_reader :primes

  def initialize(limit)
    @primes = sieve(limit)
  end

  def sieve(limit)
    array = (0..limit).to_a
    array.each do |iter1|
      next if iter1 < 2
      2.upto((limit / iter1)) do |iter2|
        array[iter1 * iter2] = 0
      end
    end
    array.uniq - [0, 1]
  end
end

module BookKeeping
  VERSION = 1
end
