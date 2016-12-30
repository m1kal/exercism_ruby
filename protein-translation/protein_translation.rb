class Translation
  CODONS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA)
  }.freeze

  def self.of_codon(codon)
    raise InvalidCodonError, 'Incorrect codon' if codon =~ /[^AGUC]/
    CODONS.select { |_, value| value.include?(codon.upcase) }.keys[0]
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).collect { |codon| of_codon(codon.join('')) }
          .join(' ').gsub(/STOP.*$/, '').split(' ')
  end
end

class InvalidCodonError < ArgumentError
end
