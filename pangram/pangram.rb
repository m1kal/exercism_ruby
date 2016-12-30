class Pangram
  def self.pangram?(phrase)
    !character_missing(phrase.downcase)
  end

  def self.character_missing(phrase)
    ('a'..'z').select { |char| !phrase.include?(char) }.any?
  end
end

module BookKeeping
  VERSION = 3
end
