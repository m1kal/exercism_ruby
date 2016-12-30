class Acronym
  def self.abbreviate(input)
    find_first_letters(input).join.upcase
  end

  def self.find_first_letters(input)
    input.gsub(/([a-z])([A-Z])/, '\1 \2').split(/\W/).collect { |w| w[0] }
  end
end

module BookKeeping
  VERSION = 2
end
