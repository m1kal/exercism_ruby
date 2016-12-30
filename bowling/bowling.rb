class Game
  MAX = 10
  class BowlingError < StandardError; end

  def roll(value)
    if @rolls.nil?
      @rolls = [[value]]
    elsif next_frame
      @rolls << [value]
    else
      @rolls.last << value
    end
  end

  def score
    raise BowlingError, errors_found if errors_found
    @rolls[0..9].each_with_index.reduce(0) { |sum, (_, idx)| sum + frame(idx) }
  end

  def frame(idx)
    @rolls[idx].reduce(&:+) + strike_bonus(idx) + spare_bonus(idx)
  end

  def spare?(idx)
    @rolls[idx].reduce(&:+) == MAX && !strike?(idx)
  end

  def strike?(idx)
    @rolls[idx].first == MAX
  end

  def errors_found
    !size_valid? || !@rolls.each_with_index.all? { |_, idx| values_valid?(idx) }
  end

  def size_valid?
    !@rolls.nil? && (size_valid_no_bonus_round? || size_valid_with_bonus_round?)
  end

  def size_valid_no_bonus_round?
    @rolls.size == 10 && !spare?(9) && !strike?(9)
  end

  def size_valid_with_bonus_round?
    @rolls.size == 11 &&
      (spare?(9) || strike?(9)) && strike?(9) ^ @rolls[10][1].nil?
  end

  def values_valid?(idx)
    (@rolls[idx].reduce(&:+) <= MAX || (idx == 10 && @rolls[idx][0] == MAX)) &&
      @rolls[idx].all? { |pins| pins <= MAX && pins >= 0 }
  end

  def next_frame
    (@rolls.empty? || @rolls.last.size == 2 || strike?(-1)) && @rolls.size < 11
  end

  def spare_bonus(idx)
    spare?(idx) ? @rolls[idx + 1].first : 0
  end

  def strike_bonus(idx)
    strike?(idx) ? @rolls[idx + 1].first + second_bonus(idx) : 0
  end

  def second_bonus(idx)
    @rolls[idx + 1][1].nil? ? @rolls[idx + 2].first : @rolls[idx + 1][1]
  end
end

module BookKeeping
  VERSION = 3
end
