class Series
  def initialize(input)
    @string = input
  end

  def slices(len)
    raise ArgumentError if len > @string.size

    0.upto(@string.size - len).collect do |start|
      @string.slice(start, len).chars.map(&:to_i)
    end
  end
end
