# not sure which array methods I am allowed to use...
# arrays uses fetch
# reverser uses [] and <<
class ListOps
  def self.arrays(input)
    size = 0
    begin
      loop do
        input.fetch(size)
        size += 1
      end
    rescue
      return size
    end
  end

  def self.reverser(input)
    array = []
    size = arrays(input)
    0.upto(size - 1) do |idx|
      array << input[size - idx - 1]
    end
    array
  end

  def self.concatter(input1, input2)
    append(append([], input1), input2)
  end

  def self.append(array, input)
    size = arrays(input)
    0.upto(size - 1) do |idx|
      array << input[idx]
    end
    array
  end

  def self.mapper(input, &block)
    return input unless block_given?
    array = []
    size = arrays(input)
    0.upto(size - 1) do |idx|
      array << yield(input[idx])
    end
    array
  end

  def self.filterer(input, &block)
    return input unless block_given?
    array = []
    size = arrays(input)
    0.upto(size - 1) do |idx|
      array << input[idx] if yield(input[idx])
    end
    array
  end

  def self.sum_reducer(input)
    value = 0
    size = arrays(input)
    0.upto(size - 1) do |idx|
      value += input[idx]
    end
    value
  end

  def self.factorial_reducer(input)
    value = 1
    size = arrays(input)
    0.upto(size - 1) do |idx|
      value *= input[idx]
    end
    value
  end
end

module BookKeeping
  VERSION = 2
end
