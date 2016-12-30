class Board
  DIRECTIONS = [[0, 1], [-1, 1], [-1, 0], [0, -1], [1, 0], [1, -1]].freeze

  def initialize(board)
    @board = board.map { |row| row.tr(' ', '').split('') }
  end

  def winner
    %w(X O).select { |player| path_exists(player) }.first || ''
  end

  def path_exists(player)
    @board = @board.transpose if player == 'O'
    return false if @board.none? { |row| row[0] == player }
    @board.each_with_index.any? do |_, row_idx|
      continue_path([], row_idx, 0, player)
    end
  end

  def continue_path(path, row, column, player)
    return false if end_of_path(path, row, column, player)
    return true if column == @board[0].size - 1
    DIRECTIONS.any? do |direction|
      continue_path(path + [[row, column]],
                    row + direction[0], column + direction[1], player)
    end
  end

  def end_of_path(path, row, column, player)
    path.include?([row, column]) || row < 0 || column < 0 ||
      row >= @board.size || @board[row][column] != player
  end
end

module BookKeeping
  VERSION = 1
end
