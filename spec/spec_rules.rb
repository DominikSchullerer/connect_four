require_relative "./../lib/rules"

describe Rules do
  context "#self.winning_turn?" do
    it "returns false for no win" do
      boardstate = Array.new(7, Array.new(6, nil))

      expect(Rules.winning_turn?(boardstate, "O")).to be(false)
    end

    context ":horizontal_win" do
      it "returns true for a horizontal win starting in the first column" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[0 + shift][0] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end

      it "returns true for a horizontal win starting in the fourth column" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[3 + shift][5] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end
    end

    context ":vertical_win" do
      it "returns true for a vertical win starting in the first row" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[0][0 + shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end

      it "returns true for a vertical win starting in the third row" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[6][2 + shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end
    end

    context ":down_diagonal_win" do
      it "returns true for a down_diagonal win starting in the fourth row, first column" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[0 + shift][3 - shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end

      it "returns true for a down_diagonal win starting in the sixth row, fourth column" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[3 + shift][5 - shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end
    end

    context ":up_diagonal_win" do
      it "returns true for a up_diagonal win starting in the first row, first column" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[0 + shift][0 + shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end

      it "returns true for a up_diagonal win starting in the third row, fourth colum" do
        boardstate = Array.new(7, Array.new(6, nil))
        3.times.each do |shift|
          boardstate[3 + shift][2 + shift] = "O"
        end

        expect(Rules.winning_turn?(boardstate, "O")).to be(true)
      end
    end
  end
end
