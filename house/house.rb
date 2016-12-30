class House
  START = 'This is'.freeze
  THE = ' the '.freeze
  ITEM = [
    'house', 'malt', 'rat', 'cat', 'dog',
    'cow with the crumpled horn', 'maiden all forlorn',
    'man all tattered and torn', 'priest all shaven and shorn',
    'rooster that crowed in the morn', 'farmer sowing his corn',
    'horse and the hound and the horn'
  ].freeze
  THAT = "\n" + 'that '.freeze
  WHAT = [
    'Jack built.' + "\n", 'lay in', 'ate', 'killed', 'worried', 'tossed',
    'milked', 'kissed', 'married', 'woke', 'kept', 'belonged to'
  ].freeze

  def self.recite(verses = 11)
    build_verses(verses).compact.join("\n").sub(/(^.*house)\n(.*$)/, '\1 \2')
  end

  def self.build_verses(verses)
    [verses.zero? ? nil : recite(verses - 1),
     START +
       verses.downto(0).reduce('') do |acc, verse|
         acc + THE + ITEM[verse] + THAT + WHAT[verse]
       end]
  end
end
