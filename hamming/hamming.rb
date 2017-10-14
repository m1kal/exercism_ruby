# a
class Hamming
  def self.compute(str1, str2)
    raise ArgumentError, 'Length mismatch' if str1.size != str2.size
    str1.split('').zip(str2.split('')).map(&:uniq).flatten.size - str1.size
  end
end

module BookKeeping
  VERSION = 3
end
