require_relative "./board"
require_relative "./player"
require_relative "./rules"

class GM
  def initialize
    puts "Connect Four"
    @winner = nil
    main_loop
  end

  def new_game
    @board = Board.new
    puts "Enter the name of the first player"
    @player_1 = Player.new(gets.chomp, @board, "O")
    puts "Enter the name of the second player"
    @player_2 = Player.new(gets.chomp, @board, "X")
    @current_player = [@player_1, @player_2].sample
    game_loop
  end

  def game_turn
    @board.draw_board
    @board.play_column(@current_player.player_input, @current_player.symbol)
    if Rules.winning_turn?(@board.boardstate, @current_player.symbol)
      @winner = @current_player
    else
      @current_player = if @current_player == @player_1
        @player_2
      else
        @player_1
      end
    end
  end

  def game_loop
    while @winner.nil? && !@board.full?
      game_turn
    end
    end_message
  end

  def end_message
    @board.draw_board
    if @winner.nil?
      puts "It's a tie!"
    else
      puts "#{@winner.name} has won the game!"
    end
  end

  def main_loop
    loop do
      puts "(p)lay or (q)uit"
      input = gets.chomp.downcase
      break if input == "q"
      new_game if input == "p"
    end
  end
end
