class IsbnVerifier
  def self.valid?(candidate)
    candidate_without_dashes = candidate.gsub("-","")
    return false unless candidate_without_dashes.match(/^\d{9}[\dX]$/)
    (candidate_without_dashes
     .split("")
     .map { |char| char == "X" ? 10 : char.to_i }
     .reverse
     .map
     .with_index { |digit, idx| digit * (idx+1)}
     .reduce(&:+) % 11).zero?
  end
end

module BookKeeping
  VERSION = 1
end
