class RailFenceCipher
  VERSION = 1

  def self.encode(input, size)
    fence = []
    row = 0
    dir = :down
    0.upto(input.size - 1) do |col|
      fence[row] ||= []
      fence[row] << input[col]
      dir, row = update_row(row, dir, size)
    end
    fence.flatten.join
  end

  def self.decode(input, size)
    str = input.dup
    fence = set_up_fence(str.size, size)
    hash = {}
    fence.each do |row_array|
      row_array.each do |lookup|
        hash[lookup] = str.slice!(0)
      end
    end
    hash.sort.to_h.values.join
  end

  def self.set_up_fence(length, rows)
    fence = []
    row = 0
    dir = :down
    0.upto(length - 1) do |col|
      fence[row] ||= []
      fence[row] << col
      dir, row = update_row(row, dir, rows)
    end
    fence
  end

  def self.update_row(row, dir, size)
    return [:down, 0] if size == 1
    if row.zero?
      [:down, 1]
    elsif row == size - 1
      [:up, size - 2]
    elsif dir == :down
      [:down, row + 1]
    else
      [:up, row - 1]
    end
  end
end
