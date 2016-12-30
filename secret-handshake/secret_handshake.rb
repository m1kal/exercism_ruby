class SecretHandshake
  attr_reader :commands

  COMMANDS = {
    0 => 'wink',
    1 => 'double blink',
    2 => 'close your eyes',
    3 => 'jump'
  }.freeze

  def initialize(input)
    @commands = []
    return if input =~ /[^\d*]/
    @commands = 0.upto(COMMANDS.size - 1).collect do |bit|
      COMMANDS[bit] if (input.to_s(2).reverse[bit] || '0') == '1'
    end.compact
    @commands.reverse! if (input.to_s(2).reverse[4] || '0') == '1'
  end
end
