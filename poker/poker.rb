class Poker
  def initialize(hands)
    @hands = hands.collect { |hand| Hand.new(hand) }.sort_by(&:value)
  end

  def best_hand
    @hands.select do |hand|
      hand.value == @hands.last.value
    end.reverse
  end
end

class Hand < Array
  def initialize(hand)
    super
    @count = {}
    each do |value|
      @count[value.card_value] = (@count[value.card_value] || 0) + 1
    end
    @values = collect(&:card_value).sort
  end

  def value
    (straight_flush_value || repetitions_value || two_pairs_value || 0) +
      high_card_value
  end

  def straight_flush_value
    shift_number(exponent_value, high_card_value) if flush || straight
  end

  def exponent_value
    128 - (straight ? 0 : 48) - (flush ? 0 : 64)
  end

  def rep_exponent_and_value
    case @count.values.sort
    when [1, 4] then [112, @count.key(4)]
    when [2, 3] then [96, @count.key(3)]
    when [1, 1, 3] then [48, @count.key(3)]
    when [1, 1, 1, 2] then [16, @count.key(2)]
    end
  end

  def shift_number(exponent, number)
    2**exponent * number
  end

  def repetitions_value
    shift_number(*rep_exponent_and_value) unless rep_exponent_and_value.nil?
  end

  def two_pairs_value
    return if @count.values.sort != [1, 2, 2]
    shift_number(32, @count.select { |_, value| value == 2 }.keys.max) +
      shift_number(16, @count.select { |_, value| value == 2 }.keys.min)
  end

  def high_card_value
    return 5 if straight_to_five
    select { |value| @count[value.card_value] == 1 }
      .sort_by(&:card_value)
      .each_with_index.reduce(0) do |acc, (card, idx)|
      acc + 2**idx * card.card_value
    end
  end

  def flush
    collect { |card| card[-1] }.uniq.size == 1
  end

  def straight
    @count.size == 5 && @values.max - @values.min == 4 || straight_to_five
  end

  def straight_to_five
    @values == [0, 1, 2, 3, 12]
  end
end

class String
  CARDS = (2..10).to_a.collect(&:to_s) + %w(J Q K A).freeze

  def card_value
    CARDS.index(self[0..-2])
  end
end

module BookKeeping
  VERSION = 2
end
