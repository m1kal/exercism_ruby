class Proverb
  START = 'For want of a '.freeze
  THE = ' the '.freeze
  WAS_LOST = " was lost.\n".freeze

  def initialize(*input, **hash)
    @items = input
    @qualifier = hash[:qualifier]
  end

  def to_s
    0.upto(@items.size - 2).each.collect { |idx| line(idx) }.join +
      'And all for the want of a ' +
      [@qualifier, @items[0]].compact.join(' ') + '.'
  end

  def line(idx)
    START + @items[idx].to_s + THE + @items[idx + 1].to_s + WAS_LOST
  end

  private :line
end
