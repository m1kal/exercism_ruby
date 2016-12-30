class PigLatin
  def self.translate(input)
    input.split(' ').each.collect do |word|
      split_word(word).reverse.join + 'ay'
    end.join(' ')
  end

  def self.split_word(input)
    idx = 0
    idx += 1 until vowel(input, idx)
    [idx.zero? ? '' : input[0..idx - 1], input[idx..-1]]
  end

  def self.vowel(input, idx)
    (input[idx] =~ /[aeiou]/ || as_vowel(input, idx, /[xy]/)) &&
      !special_case(input, idx, 'qu')
  end

  def self.as_vowel(input, idx, pattern)
    input[idx] =~ pattern && !vowel(input, idx + 1)
  end

  def self.special_case(input, idx, chars)
    idx > 0 && input[idx - 1, chars.length] == chars
  end
end
