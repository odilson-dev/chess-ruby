require_relative '../../../lib/pieces/rook'
require_relative '../../../lib/pieces/pawn'

RSpec.describe Rook do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the rook is in the middle of the chessboard (eg: [3, 3])" do
            let(:rook) { Rook.new([3, 3], "white") }
            moves_allowed = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3], [3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7]]
            it "The allowed moves are: [[0, 3], [1, 3] [2, 3], [4, 3], [5, 3], [6, 3], [7, 3], [3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7]]" do
                expect(rook.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the rook is at the bottom of the chessboard(eg: [7, 4])" do
            let(:rook) { Rook.new([7, 4], "white") }
            moves_allowed = [[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4],
            [6, 4], [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6],[7, 7]]
            it "The allowed moves are: [[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4],
            [6, 4], [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6],[7, 7]]" do
                expect(rook.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the king is at the corner of the chessboard (eg: [7, 7])" do
            let(:rook) { Rook.new([7, 7], "white") }
            moves_allowed = [[0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7],
                            [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]]
            it "The allowed moves are: [[0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]]" do
                expect(rook.allowed_moves).to be_same_as moves_allowed
            end
        end
        context "When the position of the white rook is in the middle of the chessboard (eg: [3, 3]), and there is 1 black pawns on each side of the row" do
            
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([1, 3], "black")
                pawn_2 = Pawn.new([3, 1], "black")
                pawn_3 = Pawn.new([6, 3], "black")
                pawn_4 = Pawn.new([3, 6], "black")
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                chessboard_1.add(pawn_4)
            end
            let(:rook) { Rook.new([3, 3], "white", chessboard_1) }
            moves_allowed = [[3, 2], [2, 3], [3, 4], [3, 5], [4, 3], [5, 3]]
            it "The allowed moves are: [[[3, 2], [2, 3], [3, 4], [3, 5], [4, 3], [5, 3]]" do
                expect(rook.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[1, 3], [3, 1], [6, 3], [3, 6]]
            it "set the attack_moves to [[1, 3], [3, 1], [6, 3], [3, 6]]" do
                expect(rook.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white rook is in the middle of the chessboard (eg: [3, 3]), and there is 1 white pawn on each side of the row" do
            
            let(:chessboard_2) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([1, 3], "white")
                pawn_2 = Pawn.new([3, 1], "white")
                pawn_3 = Pawn.new([6, 3], "white")
                pawn_4 = Pawn.new([3, 6], "white")
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
                chessboard_2.add(pawn_3)
                chessboard_2.add(pawn_4)
            end
            let(:rook) { Rook.new([3, 3], "white", chessboard_2) }
            moves_allowed = [[3, 2], [2, 3], [3, 4], [3, 5], [4, 3], [5, 3]]
            it "The allowed moves are: [[[3, 2], [2, 3], [3, 4], [3, 5], [4, 3], [5, 3]]" do
                expect(rook.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(rook.attack_moves).to be_empty
            end
        end
    end
end