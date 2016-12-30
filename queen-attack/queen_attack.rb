class Queens
  def initialize(hash)
    @white = validate(hash[:white]) unless hash[:white].nil?
    @black = validate(hash[:black]) unless hash[:black].nil?
  end

  def validate(position)
    raise ArgumentError if position.any? { |pos| pos > 7 || pos < 0 }
    position
  end

  def attack?
    on_same_row? || on_same_column? || on_right_diagonal? || on_left_diagonal?
  end

  def on_same_row?
    @white[0] == @black[0]
  end

  def on_same_column?
    @white[1] == @black[1]
  end

  def on_right_diagonal?
    @white[0] - @white[1] == @black[0] - @black[1]
  end

  def on_left_diagonal?
    @white[0] + @white[1] == @black[0] + @black[1]
  end
end

module BookKeeping
  VERSION = 2
end
