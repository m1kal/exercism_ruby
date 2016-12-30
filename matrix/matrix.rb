class Matrix
  attr_reader :rows, :columns
  def initialize(input)
    @rows = input.split("\n").collect { |row| row.split(' ').collect(&:to_i) }
    @columns = @rows.transpose
  end
end
