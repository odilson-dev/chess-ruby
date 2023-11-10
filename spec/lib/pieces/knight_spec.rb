require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/pieces/pawn'

RSpec.describe Knight do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the knight is in the middle of the chessboard (eg: [4, 3])" do
            let(:knight) { Knight.new([4, 3], "White") }
            moves_allowed = [[3,1], [2, 2], [5, 1], [6, 2], [2, 4], [3, 5], [5, 5], [6, 4]]
            it "The allowed moves are: [[3,1], [2, 2], [5, 1], [6, 2], [2, 4], [3, 5], [5, 5], [6, 4]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is at the bottom of the chessboard(eg: [7, 4])" do
            let(:knight) { Knight.new([7, 4], "White") }
            moves_allowed = [[6, 2], [5, 3], [5, 5], [6, 6]]
            it "The allowed moves are: [[6, 2], [5, 3], [5, 5], [6, 6]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is at the corner of the chessboard (eg: [7, 7])" do
            let(:knight) { Knight.new([7, 7], "White") }
            moves_allowed = [[5, 6], [6, 5]]
            it "The allowed moves are: [[5, 6], [6, 5]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is [1, 2])" do
            let(:knight) { Knight.new([1, 2], "White") }
            moves_allowed = [[0, 0], [2, 0], [3, 1], [3, 3], [2, 4], [0, 4]]
            it "The allowed moves are: [[0, 0], [2, 0], [3, 1], [3, 3], [2, 4], [0, 4]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
        end
        context "When the position of the white knight is in the middle of the chessboard (eg: [4, 3]), and there is 3 black pawns on possible moves" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([3, 1], "black")
                pawn_2 = Pawn.new([2, 4], "black")
                pawn_3 = Pawn.new([5, 5], "black")
                
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                
            end

            let(:knight) { Knight.new([4, 3], "white", chessboard_1) }
            moves_allowed = [[2, 2], [3, 5], [5, 1], [6, 2], [6, 4]]
            it "The allowed moves are: [[2, 2], [3, 5], [5, 1], [6, 2], [6, 4]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[3, 1], [2, 4], [5, 5]]
            it "set the attack_moves to [[3, 1], [2, 4], [5, 5]]" do
                expect(knight.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white knight is in the middle of the chessboard (eg: [4, 3]), and there is 1 white pawn on each diagonal row" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([3, 1], "white")
                pawn_2 = Pawn.new([2, 4], "white")
                pawn_3 = Pawn.new([5, 5], "white")
                
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
                chessboard_2.add(pawn_3)
            end
            let(:knight) { Knight.new([4, 3], "white", chessboard_2) }

            moves_allowed = [[2, 2], [3, 5], [5, 1], [6, 2], [6, 4]]

            it "The allowed moves are: [[2, 2], [3, 5], [5, 1], [6, 2], [6, 4]]" do
                expect(knight.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(knight.attack_moves).to be_empty
            end
        end
        
    end
end