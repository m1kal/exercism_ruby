class Garden
  PLANT = {
    'V' => :violets, 'C' => :clover,
    'R' => :radishes, 'G' => :grass
  }.freeze
  def initialize(input, names = ('a'..'z').to_a)
    @names = names.collect { |name| name[0].downcase }.sort
    @array = input.split("\n").collect { |row| row.split('') }.transpose
  end

  def respond_to_missing?(name)
    name =~ /^[a-zA-Z]+/
  end

  def method_missing(name)
    super unless respond_to_missing?(name)
    idx = @names.index(name.to_s[0])
    @array[2 * idx, 2].transpose.flatten.collect { |letter| PLANT[letter] }
  end
end
