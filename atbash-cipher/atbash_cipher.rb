class Atbash
  def self.encode(input)
    chunks(input.downcase.gsub(/[^a-z0-9]/, '').each_char.map(&:encode_char), 5)
  end

  def self.chunks(input, length)
    input.each_slice(length).map(&:join).join(' ')
  end
end

class String
  def encode_char
    ord < 'a'.ord ? self : ('a'.ord + 'z'.ord - ord).chr
  end
end
