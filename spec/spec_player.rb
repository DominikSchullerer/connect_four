require_relative "./../lib/player"

describe Player do
  context "#valid_input" do
    let(:board) { double("board") }
    subject(:player) { described_class.new("player", board, "O") }
    # This method checks if a input is valid.
    # To Test: Possible returns

    it "returns valid input" do
      valid_input = 4
      expect(player.valid_input(valid_input)).to be(valid_input)
    end

    it "accepts smallest valid input" do
      smallest_input = 1
      expect(player.valid_input(smallest_input)).to be(smallest_input)
    end

    it "accepts largest valid input" do
      largest_input = 4
      expect(player.valid_input(largest_input)).to be(largest_input)
    end

    it "returns nil for input that is too small" do
      too_small_input = 10
      expect(player.valid_input(too_small_input)).to be_nil
    end

    it "returns nil for input that is too small" do
      too_large_input = 10
      expect(player.valid_input(too_large_input)).to be_nil
    end
  end

  context "#player_input" do
    let(:board) { double("board") }
    subject(:player) { described_class.new("player", board, "O") }
    # This method gets a valid player input
    # To Test: puts prompt, loop exit, loop continue, call of #valid_input, call of Board.#column_full?
    # The method depends on #valid_input and Board.#full?(column)
    prompt_string = "Please enter a column number."
    error_string = "Please enter a valid column number."

    before do
      allow(player).to receive(:gets).and_return("4")
      allow(player).to receive(:puts)
      allow(board).to receive(:column_full?).and_return(false)
    end

    it "puts the prompt" do
      allow(player).to receive(:valid_input).and_return(4)

      expect(player).to receive(:puts).with(prompt_string).once
      player.player_input
    end

    it "puts the error message once for no valid user input" do
      allow(player).to receive(:gets).and_return("a", "4")
      allow(player).to receive(:valid_input).and_return(4)

      expect(player).to receive(:puts).with(error_string).once
      player.player_input
    end

    it "exits the loop for a valid input" do
      allow(player).to receive(:valid_input).and_return(4)

      expect(player).not_to receive(:puts).with(error_string)
      player.player_input
    end

    it "puts the error message once for no valid input" do
      allow(player).to receive(:valid_input).and_return(nil, 4)

      expect(player).to receive(:puts).with(error_string).once
      player.player_input
    end

    it "puts the error message once for a full column" do
      allow(player).to receive(:valid_input).and_return(4)
      allow(board).to receive(:column_full?).and_return(true, false)

      expect(player).to receive(:puts).with(error_string).once
      player.player_input
    end

    it "calls on valid_input" do
      allow(player).to receive(:valid_input).and_return(4)

      expect(player).to receive(:valid_input).once
      player.player_input
    end
  end
end
