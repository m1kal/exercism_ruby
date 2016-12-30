class Cipher
  ALPHABET_LENGTH = 'z'.ord - 'a'.ord + 1

  attr_accessor :key

  def initialize(key = nil)
    @key = validate(key) ||
           (('a'..'z').to_a.join * 100).split('').sample(100).join
  end

  def validate(key)
    raise ArgumentError if key =~ /[^a-z]/ || (!key.nil? && key.empty?)
    key
  end

  def encode(plaintext)
    map_message(plaintext, 1)
  end

  def decode(ciphertext)
    map_message(ciphertext, -1)
  end

  def map_char(char, idx, sign)
    ((char.ord - 'a'.ord + sign * key_map(idx)) % ALPHABET_LENGTH + 'a'.ord).chr
  end

  def key_map(idx)
    @key[idx % @key.length].ord - 'a'.ord
  end

  def map_message(input, sign)
    input.each_char.with_index.collect do |char, idx|
      map_char(char, idx, sign)
    end.join
  end

  private :validate, :map_char, :key_map, :map_message
end
