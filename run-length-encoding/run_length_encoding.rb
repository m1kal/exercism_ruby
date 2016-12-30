# the code works, but the repetitions need some work
class RunLengthEncoding
  def self.encode(input)
    string = String.new(input)
    output = ''
    output += encode_sequence(string) until string.empty?
    output
  end

  def self.decode(input)
    string = String.new(input)
    output = ''
    output += decode_sequence(string) until string.empty?
    output
  end

  def self.encode_sequence(input)
    number = 1
    char = ''
    input.gsub!(/^(.)\1*/) do |read_char|
      number = read_char.size
      char = read_char[0]
      ''
    end
    (number > 1 ? number.to_s : '') + char
  end

  def self.decode_sequence(input)
    number = 1
    input.gsub!(/^\d+/) do |read_number|
      number = read_number.to_i
      ''
    end
    input.slice!(/\D/) * number.to_i
  end
end

module BookKeeping
  VERSION = 2
end
