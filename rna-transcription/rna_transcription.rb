class Complement
  COMPLEMENTS = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  def self.of_dna(dna)
    dna.delete(COMPLEMENTS.keys.join).length > 0 ? "" :
      dna.each_char.collect { |current|
        COMPLEMENTS[current]
      }.join
  end
end




module BookKeeping
  VERSION = 4
end
