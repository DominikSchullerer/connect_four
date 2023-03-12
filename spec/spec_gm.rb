require_relative "./../lib/gm"

describe GM do
  subject(:gm) { described_class.new }

  context "#start_new_game" do
    before do
      allow(Board).to receive(:new).and_return("board")
      allow(Player).to receive(:new).and_return("player_1", "player_2")
      allow(gm).to receive(:gets).and_return("Spieler 1", "Spieler 2")
      allow(gm).to receive(:puts)
    end

    it "creates a new board" do
      expect(Board).to receive(:new)
      gm.new_game
    end

    it "changes the board variable" do
      expect { gm.new_game }.to change { gm.instance_variable_get(:@board) }.to("board")
    end

    it "sets up player 1" do
      expect(Player).to receive(:new).with("Spieler 1", "board", "O")
      gm.new_game
    end

    it "changes the player_1 variable" do
      expect { gm.new_game }.to change { gm.instance_variable_get(:@player_1) }.to("player_1")
    end

    it "set up player 2" do
      expect(Player).to receive(:new).with("Spieler 2", "board", "X")
      gm.new_game
    end

    it "changes the player_2 variable" do
      expect { gm.new_game }.to change { gm.instance_variable_get(:@player_2) }.to("player_2")
    end
  end

  context "#game_turn" do
    subject(:gm) { described_class.new }
    let(:board) { double("board") }
    let(:player_1) { double("player_1") }
    let(:player_2) { double("player_2") }
    
    before do
      gm.instance_variable_set(:@board, board)
      gm.instance_variable_set(:@current_player, player_1)
      gm.instance_variable_set(:@player_1, player_1)
      gm.instance_variable_set(:@player_2, player_2)

      allow(board).to receive(:draw_board)
      allow(board).to receive(:play_column)
      allow(board).to receive(:boardstate)
      allow(player_1).to receive(:player_input).and_return(1)
      allow(player_1).to receive(:symbol).and_return("O")
      allow(Rules).to receive(:winning_turn?).and_return(false)
    end

    it "draws the board" do
      expect(board).to receive(:draw_board)
      gm.game_turn
    end

    it "gets input of current player" do
      expect(player_1).to receive(:player_input)
      gm.game_turn
    end

    it "plays a column" do
      expect(board).to receive(:play_column).with(1, "O")
      gm.game_turn
    end

    it "checks if the move was a winning turn" do
      expect(Rules).to receive(:winning_turn?)
      gm.game_turn
    end

    it "changes the winner for a winning move" do
      allow(Rules).to receive(:winning_turn?).and_return(true)

      expect { gm.game_turn }.to change { gm.instance_variable_get(:@winner) }.to(player_1)
    end

    it "changes the current player if not a winning move" do
      expect { gm.game_turn }.to change { gm.instance_variable_get(:@current_player) }.to(player_2)
    end
  end
end
