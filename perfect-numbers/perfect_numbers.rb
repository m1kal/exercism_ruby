class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    case (1..number / 2).select { |value| (number % value).zero? }.reduce(&:+)
    when 1..number - 1 then 'deficient'
    when number then 'perfect'
    else 'abundant'
    end
  end
end

class BookKeeping
  VERSION = 1
end
