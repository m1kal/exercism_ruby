class FoodChain
  VERB = "swallowed".freeze
  TO_SWALLOW = "to swallow".freeze
  SPIDER_BEHAVIOR = "wriggled and jiggled and tickled inside her".freeze
  INTRO = "I know an old lady who " + VERB + " a ".freeze
  ANIMALS = %w(fly spider bird cat dog goat cow horse).freeze
  COMMENT = [
    "",
    "It " + SPIDER_BEHAVIOR + ".\n",
    "How absurd ",
    "Imagine that, ",
    "What a hog, ",
    "Just opened her throat and ",
    "I don't know how she ",
    "She's dead, of course!\n"
  ].freeze
  ACTION = "She " + VERB + " the ".freeze
  REASON = " to catch the ".freeze
  LAST = "I don't know why " + ACTION.downcase +
         "fly. Perhaps she'll die.".freeze
  EOL = ".\n".freeze

  def self.song(idx = 7)
    (idx.zero? ? "" : song(idx - 1) + "\n\n") +
      INTRO + ANIMALS[idx] + EOL + rhyme(idx) + explanation(idx)
  end

  def self.rhyme(idx)
    COMMENT[idx] + rhyme_continue(idx) +
      ((2..6) === idx ? " a " + ANIMALS[idx] + "!\n" : "")
  end

  def self.rhyme_continue(idx)
    return "" unless (2..6) === idx
    idx < 5 ? TO_SWALLOW : VERB
  end

  def self.explanation(idx)
    return "" if idx == 7
    (idx > 0 ? continuation(idx) : "") +
      idx.downto(2).collect { |elem| continuation(elem - 1) }.join +
      LAST
  end

  def self.continuation(idx)
    ACTION + ANIMALS[idx - 1, 2].reverse.join(REASON) + wriggled(idx - 1) + EOL
  end

  def self.wriggled(idx)
    idx == 1 ? " that " + SPIDER_BEHAVIOR : ""
  end
end

module BookKeeping
  VERSION = 2
end
