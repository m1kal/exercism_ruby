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

  def self.concatter(input)
  end

  def self.mapper(input, &block)
  end
end
