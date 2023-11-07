require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/pawn'


RSpec.describe Bishop do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves_diagonally" do
        context "When the position of the bishop is in the middle of the chessboard (eg: [4, 3])" do
            let(:bishop) { Bishop.new([4, 3], "White") }
            moves_allowed = [[1, 0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
                            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7]]
            it "The allowed moves are: [[1, 0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7]]" do
                expect(bishop.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the bishop is at the bottom of the chessboard(eg: [7, 3])" do
            let(:bishop) { Bishop.new([7, 3], "White") }
            moves_allowed = [[4, 0], [5, 1], [6, 2],[6, 4], [5, 5], [4, 6], [3, 7]]
            it "The allowed moves are: [[4, 0], [5, 1], [6, 2], [6, 4], [5, 5], [4, 6], [3, 7]]" do
                expect(bishop.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the bishop is at the corner of the chessboard (eg: [7, 7])" do
            let(:bishop) { Bishop.new([7, 7], "White") }
            moves_allowed = [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]
            it "The allowed moves are: [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]" do
                expect(bishop.allowed_moves).to be_same_as moves_allowed
            end
        end
        context "When the position of the white bishop is in the middle of the chessboard (eg: [4, 3]), and there is 1 black pawn on each diagonal row" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([2, 1], "black")
                pawn_2 = Pawn.new([1, 6], "black")
                pawn_3 = Pawn.new([5, 2], "black")
                pawn_4 = Pawn.new([7, 6], "black")
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                chessboard_1.add(pawn_4)
            end

            let(:bishop) { Bishop.new([4, 3], "white", chessboard_1) }
            moves_allowed = [[3, 2], [2, 5], [3, 4], [5, 4], [6, 5]]
            it "The allowed moves are: [[3, 2] [2, 5], [3, 4], [5, 4], [6, 5]]" do
                expect(bishop.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[2, 1], [1, 6], [5, 2], [7, 6]]
            it "set the attack_moves to [[2, 1], [1, 6], [5, 2], [7, 6]]" do
                expect(bishop.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white bishop is in the middle of the chessboard (eg: [3, 3]), and there is 1 white pawn on each diagonal row" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([2, 1], "white")
                pawn_2 = Pawn.new([1, 6], "white")
                pawn_3 = Pawn.new([5, 2], "white")
                pawn_4 = Pawn.new([7, 6], "white")
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
                chessboard_2.add(pawn_3)
                chessboard_2.add(pawn_4)
            end
            let(:bishop) { Bishop.new([4, 3], "white", chessboard_2) }

            moves_allowed = [[3, 2], [2, 5], [3, 4], [5, 4], [6, 5]]
            it "The allowed moves are: [[3, 2], [2, 5], [3, 4], [5, 4], [6, 5]]" do
                expect(bishop.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = []
            it "expect the attack_moves to be empty" do
                expect(bishop.attack_moves).to be_empty
            end
        end
    end
end