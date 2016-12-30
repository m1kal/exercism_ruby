class Nucleotide
  NUCLEOTIDES = %w(A C G T)

  def initialize(dna)
    raise ArgumentError, 'Incorrect types detected' if incorrect_input(dna)
    @sequence = dna
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(type)
    @sequence.each_char.count { |char| char == type }
  end

  def histogram
    NUCLEOTIDES.collect { |type| [type, count(type)] }.to_h
  end

  def incorrect_input(dna)
    dna =~ Regexp.new("[^ #{NUCLEOTIDES.join}]")
  end

  private :incorrect_input
end
