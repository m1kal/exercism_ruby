class WordProblem
  OPERATIONS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied by' => :*,
    'divided by' => :/
  }.freeze

  def initialize(input)
    @arg1, @arg2, @operation, @rest = parse(input)
  end

  def parse(input)
    matchdata = /(-?\d+) (\S*( by)?) (-?\d+)(.*)$/.match(input).to_a
    raise ArgumentError if matchdata.empty?
    [matchdata[1].to_i, matchdata[4].to_i, matchdata[2], matchdata[5]]
  end

  def answer
    @rest == '?' ? execute : self.class.new(execute.to_s + @rest).answer
  end

  def execute
    @arg1.send(OPERATIONS[@operation], @arg2)
  end
end
