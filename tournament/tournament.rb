class Tournament
  TOP_ROW = "Team                           | MP |  W |  D |  L |  P\n".freeze

  def self.tally(input)
    results = {}
    parse_input(input).each do |game|
      results[game[0]] ||= TeamResults.new(game[0])
      results[game[1]] ||= TeamResults.new(game[1])
      results[game[0]].send(game[2].to_s)
      results[game[1]].send(opposite(game[2]))
    end
    TOP_ROW + results.values.sort.collect(&:to_s).join("\n") + "\n"
  end

  def self.opposite(result)
    if result == 'win'
      :loss
    elsif result == 'loss'
      :win
    else
      :draw
    end
  end

  def self.parse_input(input)
    input.split("\n").reduce([]) do |acc, game|
      acc + [game.split(';')]
    end
  end
end

class TeamResults
  attr_reader :name

  def initialize(name)
    @name = name
    @win = @loss = @draw = 0
  end

  def <=>(other)
    points == other.points ? name <=> other.name : - (points <=> other.points)
  end

  def points
    3 * @win + 1 * @draw
  end

  def to_s
    @name + ' ' * (31 - @name.length) + '|  ' +
      (@win + @draw + @loss).to_s + ' |  ' +
      @win.to_s + ' |  ' +
      @draw.to_s + ' |  ' +
      @loss.to_s + ' |  ' +
      points.to_s
  end

  def win
    @win += 1
  end

  def loss
    @loss += 1
  end

  def draw
    @draw += 1
  end
end

module BookKeeping
  VERSION = 1
end
