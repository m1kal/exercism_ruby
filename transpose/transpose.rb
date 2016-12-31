class Transpose
  def self.transpose(input)
    input.split("\n").map { |row| align_and_split_row(row, input) }
         .transpose.map { |row| row.join('').sub(/ *$/, '') }
         .join("\n")
  end

  def self.align_and_split_row(row, input)
    (row + ' ' * (input.split("\n").map(&:length).max - row.length)).split('')
  end
end

module BookKeeping
  VERSION = 1
end
