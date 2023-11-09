require_relative '../../../lib/pieces/king'
require_relative '../../../lib/pieces/pawn'

RSpec.describe King do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the king is in the middle of the chessboard (eg: [5, 5])" do
            let(:king) { King.new([5, 5], "White") }
            moves_allowed = [[5, 6], [5, 4], [4, 6], [4, 5], [4, 4], [6, 6], [6, 5], [6, 4]]
            it "The allowed moves are: [[5, 6], [5, 4], [4, 6], [4, 5], [4, 4], [6, 6], [6, 5], [6, 4]]" do
                expect(king.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the king is at the corner of the chessboard (eg: [8, 8])" do
            let(:king) { King.new([7, 7], "White") }
            moves_allowed = [[7, 6],[6, 6], [6, 7]]
            it "The allowed moves are: [[7, 6],[6, 6], [6, 7]]" do
                expect(king.allowed_moves).to be_same_as moves_allowed
            end
        end
        context "When the position of the white king is in the middle of the chessboard (eg: [3, 4]), and there is 3 black pawnsaround him" do
            
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([2, 4], "black")
                pawn_2 = Pawn.new([3, 5], "black")
                pawn_3 = Pawn.new([4, 3], "black")
                
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
            end
            let(:king) { King.new([3, 4], "white", chessboard_1) }
            moves_allowed = [[3, 3], [2, 3], [2, 5], [4, 5], [4, 4]]
            it "The allowed moves are: [[3, 3], [2, 3], [2, 5], [4, 5], [4, 4]]" do
                expect(king.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[2, 4], [3, 5], [4, 3]]
            it "set the attack_moves to [[2, 4], [3, 5], [4, 3]]" do
                expect(king.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white king is in the middle of the chessboard (eg: [3, 3]), and there is 1 white pawn on each side of the row" do
            
            let(:chessboard_2) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([2, 4], "white")
                pawn_2 = Pawn.new([3, 5], "white")
                pawn_3 = Pawn.new([4, 3], "white")
                
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
                chessboard_2.add(pawn_3)
            end
            let(:king) { King.new([3, 4], "white", chessboard_2) }
            moves_allowed = [[3, 3], [2, 3], [2, 5], [4, 5], [4, 4]]
            it "The allowed moves are: [[3, 3], [2, 3], [2, 5], [4, 5], [4, 4]]" do
                expect(king.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(king.attack_moves).to be_empty
            end
        end
    end
end