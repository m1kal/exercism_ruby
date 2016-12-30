# a
class Hamming
  # strictly speaking not a copy, but influenced by others' solutions
  # and suggestions from @remcopeereboom
  def self.compute(str1, str2)
    if str1.size != str2.size
      raise ArgumentError, 'Input strands need to have the same length'
    end
    str1.size.times.count do |idx|
      str1[idx] != str2[idx]
    end
  end
end

module BookKeeping
  VERSION = 3
end
