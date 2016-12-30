class Triangle
  attr_reader :rows
  def initialize(rows)
    @rows = []
    0.upto(rows - 1) do |row|
      @rows[row] = [nil]
      0.upto(row) do |column|
        @rows[row][column] = @rows[row - 1][column - 1, 2].reduce(&:+) || 1
      end
    end
  end
end
