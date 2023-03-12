class Rules
  WIDTH = 7
  HEIGHT = 6

  def self.winning_turn?(boardstate, symbol)
    winning_turn_horizontal?(boardstate, symbol) || winning_turn_vertical?(boardstate, symbol) || winning_turn_down_diagonal?(boardstate, symbol) || winning_turn_up_diagonal?(boardstate, symbol)
  end

  private_class_method

  def self.winning_turn_horizontal?(boardstate, symbol)
    horizontal_win = false

    (0...WIDTH - 3).each do |column|
      (0...HEIGHT).each do |row|
        if boardstate[column][row] == symbol && boardstate[column + 1][row] == symbol && boardstate[column + 2][row] == symbol && boardstate[column + 3][row] == symbol
          horizontal_win = true
        end
      end
    end

    horizontal_win
  end

  def self.winning_turn_vertical?(boardstate, symbol)
    vertical_win = false

    (0...WIDTH).each do |column|
      (0...HEIGHT - 3).each do |row|
        if boardstate[column][row] == symbol && boardstate[column][row + 1] == symbol && boardstate[column][row + 2] == symbol && boardstate[column][row + 3] == symbol
          vertical_win = true
        end
      end
    end

    vertical_win
  end

  def self.winning_turn_down_diagonal?(boardstate, symbol)
    down_diagonal_win = false

    (0...WIDTH - 3).each do |column|
      (3...HEIGHT).each do |row|
        if boardstate[column][row] == symbol && boardstate[column + 1][row - 1] == symbol && boardstate[column + 2][row - 2] == symbol && boardstate[column + 3][row - 3] == symbol
          down_diagonal_win = true
        end
      end
    end

    down_diagonal_win
  end

  def self.winning_turn_up_diagonal?(boardstate, symbol)
    horizontal_win = false

    (0...WIDTH - 3).each do |column|
      (0...HEIGHT - 3).each do |row|
        if boardstate[column][row] == symbol && boardstate[column + 1][row + 1] == symbol && boardstate[column + 2][row + 2] == symbol && boardstate[column + 3][row + 3] == symbol
          horizontal_win = true
        end
      end
    end

    horizontal_win
  end
end
