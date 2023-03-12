require_relative "./rules"

class Player
  attr_reader :symbol, :name

  def initialize(name, board, symbol)
    @name = name
    @board = board
    @symbol = symbol
  end

  def player_input
    loop do
      puts "#{@name}, please enter a column number."

      user_input = gets.chomp
      valid_input = valid_input(user_input.to_i) if user_input.match?(/^\d$/)
      return valid_input - 1 unless valid_input.nil? || @board.column_full?(valid_input)

      puts "Please enter a valid column number."
    end
  end

  def valid_input(input)
    input if input.between?(1, Rules::WIDTH)
  end
end
