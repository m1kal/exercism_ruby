class Board
  def self.transform(input)
    raise ValueError if invalid(input)
    output = input.map(&:dup)
    1.upto(output.size - 2) do |row|
      1.upto(output[row].size - 2) do |column|
        output[row][column] = count_adjacent_bombs(output, row, column)
      end
    end
    output
  end

  def self.count_adjacent_bombs(array, row, column)
    return array[row][column] if array[row][column] != ' '
    [-1, 0, 1].map do |x_offset|
      [-1, 0, 1].map do |y_offset|
        check_for_bombs(array, row + x_offset, column + y_offset)
      end
    end.flatten.reduce(&:+).to_s.tr('0', ' ')
  end

  def self.check_for_bombs(array, row, column)
    array[row][column] == '*' ? 1 : 0
  end

  def self.invalid(input)
    invalid_size(input) || invalid_border(input) ||
      invalid_corner(input) || invalid_interior(input)
  end

  def self.invalid_size(input)
    input.any? { |row| row.size != input[0].size }
  end

  def self.invalid_border(input)
    input[0][1..-2] + input[-1][1..-2] =~ /[^-]/ ||
      input[1..-2].any? { |row| row[0] + row[-1] != '||' }
  end

  def self.invalid_interior(input)
    input[1..-2].any? { |row| row[1..-2] =~ /[^ \*]/ }
  end

  def self.invalid_corner(input)
    input[0][0] + input[0][-1] + input[-1][0] + input[-1][-1] =~ /[^+]/
  end
end

class ValueError < RuntimeError
end
