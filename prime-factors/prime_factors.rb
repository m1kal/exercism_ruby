class PrimeFactors
  def self.for(input)
    factorize_from(2, input)
  end

  def self.factorize_from(candidate, input)
    return [] if input == 1
    candidate += 1 until (input % candidate).zero?
    [candidate] + factorize_from(candidate, input / candidate)
  end
end
