class Scale
  attr_reader :name, :pitches

  CHROMATIC = %w(C C# D D# E F F# G G# A A# B).freeze

  def initialize(first_tone, scale_type, intervals = 'mmmmmmmmmmmm')
    @name = first_tone.upcase + ' ' + scale_type.to_s
    index = CHROMATIC.index(first_tone.capitalize)
    @pitches = []
    intervals.each_char do |interval|
      @pitches << CHROMATIC.rotate(index)[0]
      index += interval_value(interval)
    end
  end

  def interval_value(interval_name)
    case interval_name
    when 'm' then 1
    when 'M' then 2
    when 'A' then 3
    end
  end
end

class String
  NOTE_PAIRS = [['C#', 'Db'], ['D#', 'Eb'], ['F#', 'Gb'],
                ['G#', 'Ab'], ['A#', 'Bb']].freeze
  def ==(other)
    eql?(other) ||
      NOTE_PAIRS.any? do |pair|
        pair.eql?([self, other]) || pair.eql?([other, self])
      end
  end
end

module BookKeeping
  VERSION = 1
end
