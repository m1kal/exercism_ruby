class Crypto
  attr_reader :size
  def initialize(input)
    @normalized = input.downcase.gsub(/\W/, '')
    @size = Math::sqrt(@normalized.size - 1).floor + 1
  end

  def normalize_plaintext
    @normalized
  end

  def plaintext_segments
    @normalized.gsub(Regexp.new("(.{#{@size}})"), '\1 ').chomp(' ').split
  end

  def ciphertext
    0.upto(@size - 1).collect do |column|
      plaintext_segments.reduce('') do |acc, segment|
        segment[column].nil? ? acc : acc + segment[column]
      end
    end.join
  end

  def normalize_ciphertext
    split_to_blocks(ciphertext)
  end

  def split_to_blocks(input)
    buffer = Array.new(long_segments) do
      input.slice!(0..long_size - 1) + ' '
    end.join
    buffer += Array.new(short_segments) do
      input.slice!(0..short_size - 1) + ' '
    end.join
    buffer.chomp(' ')
  end

  def long_size
    plaintext_segments.size
  end

  def short_size
    plaintext_segments.size - 1
  end

  def long_segments
    ciphertext.size - (long_size - 1) * @size
  end

  def short_segments
    @size - long_segments
  end
end
