class Grains
  def self.square(input)
    input == 1 ? 1 : 2 * square(input - 1)
  end

  def self.total
    (1..64).reduce(0) { |sum, number| sum + square(number) }
  end
end
