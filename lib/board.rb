require_relative "./rules"

class Board
  attr_reader :boardstate

  def initialize
    column = Array.new(6, nil)
    @boardstate = []
    7.times { @boardstate << column.dup }
  end

  def column_full?(column_number)
    !@boardstate[column_number - 1].any?(nil)
  end

  def play_column(column_number, symbol)
    column = @boardstate[column_number]
    column.each_with_index do |cell, index|
      if cell.nil?
        boardstate[column_number][index] = symbol
        break
      end
    end
  end

  def draw_board
    system("clear")
    (Rules::HEIGHT - 1).downto(0) do |row|
      row_string = "|"
      @boardstate.each do |column|
        row_string += if column[row].nil?
          " |"
        else
          "#{column[row]}|"
        end
      end
      puts row_string
    end
    puts " 1 2 3 4 5 6 7"
  end

  def full?
    full = false

    @boardstate.each_with_index do |column, index|
      full = true if column_full?(index)
    end

    full
  end
end

####################
# board = Board.new
# board.play_column(4, "O")

# boardstate = Array.new(7, Array.new(6, nil))
# (0..3).each do |shift|
#   boardstate[3 + shift][5] = "o"
# end

# board.instance_variable_set(:@boardstate, boardstate)

# board.draw_board
####################
