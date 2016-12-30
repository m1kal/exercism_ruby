class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    candidates.reduce([]) { |acc, elem| acc + check(elem) }.uniq
  end

  def check(candidate)
    copy = candidate.downcase
    return [] if copy == @word
    @word.each_char do |char|
      return [] if copy.sub!(char, '').nil?
    end
    copy.empty? ? [candidate] : []
  end
end

module BookKeeping
  VERSION = 2
end
