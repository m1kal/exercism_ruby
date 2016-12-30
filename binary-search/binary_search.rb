class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError, 'Not sorted' if list != list.sort
    @list = list
  end

  def middle(range = [0, list.length - 1])
    (range.last + range.first + 1) / 2
  end

  def search_for(value)
    search_sublist([0, @list.length - 1], value)
  end

  def search_sublist(range, value)
    raise RuntimeError if value < @list[range[0]] || value > @list[range[-1]]
    return middle(range) if @list[middle(range)] == value
    search_sublist(select_subrange(range, value), value)
  end

  def select_subrange(range, value)
    if value < @list[middle(range)]
      [range.first, middle(range) - 1]
    else
      [middle(range), range.last]
    end
  end

  private :select_subrange, :search_sublist
end
