require_relative "./../lib/board"

describe Board do
  context "#column_full" do
    subject(:board_full) { described_class.new }
    # This method checks if a input is valid.
    # To Test: Possible returns

    it "returns true if all columns are full" do
      boardstate = Array.new(7, Array.new(6, "O"))
      board_full.instance_variable_set(:@boardstate, boardstate)

      expect(board_full.column_full?(1)).to be(true)
    end

    it "returns false if all columns empty" do
      boardstate = Array.new(7, Array.new(6, nil))
      board_full.instance_variable_set(:@boardstate, boardstate)

      expect(board_full.column_full?(1)).to be(false)
    end

    it "returns true if only checked column is full" do
      boardstate = Array.new(7, Array.new(6, nil))
      boardstate[0] = Array.new(6, "O")
      board_full.instance_variable_set(:@boardstate, boardstate)

      expect(board_full.column_full?(1)).to be(true)
    end

    it "returns false if only checked column empty" do
      boardstate = Array.new(7, Array.new(6, "O"))
      boardstate[0] = Array.new(6, nil)
      board_full.instance_variable_set(:@boardstate, boardstate)

      expect(board_full.column_full?(1)).to be(false)
    end

    it "returns true if checked column contains nil" do
      boardstate = Array.new(7, Array.new(6, "O"))
      boardstate[0][6] = nil
      board_full.instance_variable_set(:@boardstate, boardstate)

      expect(board_full.column_full?(1)).to be(false)
    end
  end

  context "play_column" do
    subject(:board) { described_class.new }

    it "places the sybmol in an empty column" do
      boardstate = Array.new(7, Array.new(6, nil))
      board.instance_variable_set(:@boardstate, boardstate)

      target_boardstate = boardstate.clone
      target_boardstate[0][0] = "O"

      expect { board.play_column(1, "O") }.to change { board.boardstate }.to(target_boardstate)
    end

    it "places the symbol in a partially filled column" do
      boardstate = Array.new(7, Array.new(6, nil))
      boardstate[0][0] = "O"
      board.instance_variable_set(:@boardstate, boardstate)

      target_boardstate = boardstate.clone
      target_boardstate[0][1] = "O"

      expect { board.play_column(1, "O") }.to change { board.boardstate }.to(target_boardstate)
    end
  end
end
