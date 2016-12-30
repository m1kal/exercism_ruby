class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    hash = {}
    @string.downcase.split(/[ ,\n:!@$%^&\.]+/).each do |w|
      hash[w.cleanup] = (hash[w.cleanup].nil? ? 0 : hash[w.cleanup]) + 1
    end
    hash
  end
end

module Cleanup
  def cleanup
    chomp("'").reverse.chomp("'").reverse
  end
end

class String
  include Cleanup
end

module BookKeeping
  VERSION = 1
end
