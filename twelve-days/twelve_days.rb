class TwelveDays
  START = 'On the '.freeze
  DAY = %w(first second third fourth fifth sixth
           seventh eighth ninth tenth eleventh twelfth).freeze
  ACTION = ' day of Christmas my true love gave to me, '.freeze
  ITEM = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves, and ',
    'three French Hens, ',
    'four Calling Birds, ',
    'five Gold Rings, ',
    'six Geese-a-Laying, ',
    'seven Swans-a-Swimming, ',
    'eight Maids-a-Milking, ',
    'nine Ladies Dancing, ',
    'ten Lords-a-Leaping, ',
    'eleven Pipers Piping, ',
    'twelve Drummers Drumming, '
  ].freeze

  def self.song
    verse(11) + "\n"
  end

  def self.verse(number)
    (number.zero? ? '' : verse(number - 1) + "\n\n") +
      START + DAY[number] + ACTION + number.downto(0).reduce('') do |acc, item|
        acc + ITEM[item]
      end
  end
end

module BookKeeping
  VERSION = 2
end
