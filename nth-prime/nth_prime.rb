require_relative '../sieve/sieve'

class Prime
  def self.nth(n)
    raise ArgumentError, 'We use 1-based counting here!' if n.zero?
    Sieve.new(2 * n * Math::log(n).round + 2).primes[n - 1]
  end
end

module BookKeeping
  VERSION = 1
end
