class Phrase
  def initialize(phrase)
    @phrase = phrase.gsub(/((\w)'(\s))|((\s)'(\w))/, '\2\3\5\6').downcase
  end

  def word_count
    hash = {}
    @phrase.split(/[ ,\n:!@$%^&\.]+/).each do |word|
      hash[word] = (hash[word] || 0) + 1
    end
    hash
  end
end

module BookKeeping
  VERSION = 1
end
