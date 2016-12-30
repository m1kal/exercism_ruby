class Isogram
  def self.is_isogram?(input)
    input.gsub(/\W/, '').upcase.chars == input.gsub(/\W/, '').upcase.chars.uniq
  end
end

module BookKeeping
  VERSION = 2
end
