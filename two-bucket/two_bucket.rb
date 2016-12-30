class TwoBucket
  ONE_TWO = %w(one two).freeze

  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(*sizes, goal, starting_bucket)
    set_values(*sizes, goal, starting_bucket == 'two')
    calculate
  end

  def answer_matrix
  end

  def set_values(size_first, size_second, goal, reorder_answers)
    @limits = [size_first, size_second]
    @limits.reverse! if reorder_answers
    @answers = reorder_answers ? ONE_TWO.reverse : ONE_TWO
    @buckets = [@limits[0], 0]
    @goal = goal
    @moves = 1
  end

  def calculate
    run_one_step until @buckets.any? { |bucket| bucket == @goal }
    @goal_bucket = (@buckets[0] == @goal ? @answers[0] : @answers[1])
    @other_bucket = (@buckets[0] == @goal ? @buckets[1] : @buckets[0])
  end

  def run_one_step
    if @buckets[0].zero?
      fill_first
    elsif @buckets[1] == @limits[1]
      empty_second
    else
      pour
    end
    @moves += 1
  end

  def fill_first
    @buckets[0] = @limits[0]
  end

  def empty_second
    @buckets[1] = 0
  end

  def pour
    if @buckets.reduce(&:+) > @limits[1]
      @buckets[0] = @buckets.reduce(&:+) - @limits[1]
      @buckets[1] = @limits[1]
    else
      @buckets[1] += @buckets[0]
      @buckets[0] = 0
    end
  end
end

module BookKeeping
  VERSION = 2
end
