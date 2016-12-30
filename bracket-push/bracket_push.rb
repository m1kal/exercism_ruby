class Brackets
  PAIRS = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }.freeze

  def self.paired?(input)
    stack = []
    input.each_char do |char|
      if PAIRS.keys.include?(char)
        stack.push(char)
      elsif PAIRS.values.include?(char)
        return false unless PAIRS[stack.pop] == char
      end
    end
    stack.empty?
  end
end

module BookKeeping
  VERSION = 3
end
