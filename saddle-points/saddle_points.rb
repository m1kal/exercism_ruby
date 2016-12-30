class Matrix
  attr_reader :rows, :columns
  def initialize(input)
    @rows = input.split("\n").collect { |row| row.split(' ').collect(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    arr = []
    @rows.each_with_index do |_, row_idx|
      @columns.each_with_index do |_, column_idx|
        arr << [row_idx, column_idx] unless
          (find_max_in_row(row_idx) & find_min_in_column(column_idx)).empty?
      end
    end
    arr
  end

  def find_max_in_row(row)
    max_val = @rows[row].max
    @rows[row].each_with_index.reduce([]) do |acc, (value, column)|
      value == max_val ? acc << [row, column] : acc
    end
  end

  def find_min_in_column(column)
    min_val = @columns[column].min
    @columns[column].each_with_index.reduce([]) do |acc, (value, row)|
      value == min_val ? acc << [row, column] : acc
    end
  end
end
