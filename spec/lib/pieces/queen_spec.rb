require_relative '../../../lib/pieces/queen'
require_relative '../../../lib/pieces/pawn'



RSpec.describe Queen do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the queen is in the middle of the chessboard (eg: [4, 3])" do
            let(:queen) { Queen.new([4, 3], "White") }
            moves_allowed = [[1,0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
                            [4, 0], [4, 1], [4, 2], [4,4], [4, 5], [4, 6], [4, 7],
                            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7],
                            [0, 3], [1, 3], [2, 3], [3, 3], [5, 3], [6, 3], [7, 3]]
            it "The allowed moves are: [[1,0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
            [4, 0], [4, 1], [4, 2], [4,4], [4, 5], [4, 6], [4, 7],
            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7],
            [0, 3], [1, 3], [2, 3], [3, 3]. [5, 3], [6, 3], [7, 3]]" do
                expect(queen.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the queen is at the bottom of the chessboard(eg: [7, 3])" do
            let(:queen) { Queen.new([7, 3], "White") }
            moves_allowed = [[4, 0], [5, 1], [6, 2],
                            [7, 0], [7, 1], [7, 2], [7, 4], [7, 5], [7, 6], [7, 7],
                            [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3],
                            [6, 4], [5, 5], [4, 6], [3, 7], ]
            it "The allowed moves are: [[4, 0], [5, 1], [6, 2],
            [7, 0], [7, 1], [7, 2], [7, 4], [7, 5], [7, 6], [7, 7],
            [6, 4], [5, 5], [4, 6], [3, 7]]" do
                expect(queen.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the queen is at the corner of the chessboard (eg: [0, 0])" do
            let(:queen) { Queen.new([0, 0], "White") }
            moves_allowed = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                            [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                            [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
            it "The allowed moves are: [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
            [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]" do
                expect(queen.find_allowed_moves).to be_same_as moves_allowed
            end
        end
        context "When the position of the white queen is in the middle of the chessboard (eg: [4, 3]), and there is 1 black pawn on each diagonal row" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([1, 3], "black")
                pawn_2 = Pawn.new([3, 4], "black")
                pawn_3 = Pawn.new([4, 5], "black")
                pawn_4 = Pawn.new([7, 0], "black")
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                chessboard_1.add(pawn_4)
            end

            let(:queen) { Queen.new([4, 3], "white", chessboard_1) }
            moves_allowed = [[1, 0], [2, 1], [3, 2], [2, 3], [3, 3], [4, 0], [4, 1], [4, 2], [4, 4], [5, 2], [5, 3], [5, 4], [5, 5], [6, 1], [6, 3], [6, 5], [7, 3], [7, 6]]
            it "The allowed moves are: [[1, 0], [2, 1], [3, 2], [2, 3], [3, 3], [4, 0], [4, 1], [4, 2], [4, 4], [5, 2], [5, 3], [5, 4], [5, 5], [6, 1], [6, 3], [6, 5], [7, 3], [7, 6]]" do
                expect(queen.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[1, 3], [3, 4], [4, 5], [7, 0]]
            it "set the attack_moves to [[1, 3], [3, 4], [4, 5], [7, 0]]" do
                expect(queen.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white queen is in the middle of the chessboard (eg: [3, 3]), and there is 1 white pawn on each diagonal row" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([1, 3], "white")
                pawn_2 = Pawn.new([3, 4], "white")
                pawn_3 = Pawn.new([4, 5], "white")
                pawn_4 = Pawn.new([7, 0], "white")
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
                chessboard_2.add(pawn_3)
                chessboard_2.add(pawn_4)
            end
            let(:queen) { Queen.new([4, 3], "white", chessboard_2) }

            moves_allowed = [[1, 0], [2, 1], [3, 2], [2, 3], [3, 3], [4, 0], [4, 1], [4, 2], [4, 4], [5, 2], [5, 3], [5, 4], [5, 5], [6, 1], [6, 3], [6, 5], [7, 3], [7, 6]]
            it "The allowed moves are: [[1, 0], [2, 1], [3, 2], [2, 3], [3, 3], [4, 0], [4, 1], [4, 2], [4, 4], [5, 2], [5, 3], [5, 4], [5, 5], [6, 1], [6, 3], [6, 5], [7, 3], [7, 6]]" do
                expect(queen.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = []
            it "expect the attack_moves to be empty" do
                expect(queen.attack_moves).to be_empty
            end
        end
        context "When the position of the white queen is in the middle and bottom of the chessboard (eg: [7, 3]), and there is 1 black pawn on each adjacent square" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([7, 2], "black")
                pawn_2 = Pawn.new([6, 2], "black")
                pawn_3 = Pawn.new([6, 3], "black")
                pawn_4 = Pawn.new([6, 4], "black")
                pawn_5 = Pawn.new([7, 4], "black")
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                chessboard_1.add(pawn_4)
                chessboard_1.add(pawn_5)
            end

            let(:queen) { Queen.new([7, 3], "white", chessboard_1) }
            it "The allowed moves are: []" do
                expect(queen.allowed_moves).to be_empty
            end
            attack_moves = [[7, 2], [6, 2], [6, 3], [6, 4], [7, 4]]
            it "set the attack_moves to [[7, 2], [6, 2], [6, 3], [6, 4], [7, 4]]" do
                expect(queen.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white queen is in the middle and bottom of the chessboard (eg: [7, 3]), and there is 1 white pawn on each adjacent square" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([7, 2], "white")
                pawn_2 = Pawn.new([6, 2], "white")
                pawn_3 = Pawn.new([6, 3], "white")
                pawn_4 = Pawn.new([6, 4], "white")
                pawn_5 = Pawn.new([7, 4], "white")
                chessboard_1.add(pawn_1)
                chessboard_1.add(pawn_2)
                chessboard_1.add(pawn_3)
                chessboard_1.add(pawn_4)
                chessboard_1.add(pawn_5)
            end
            let(:queen) { Queen.new([7, 3], "white", chessboard_2) }

           
            it "The allowed_moves array is empty" do
                expect(queen.allowed_moves).to be_empty
            end
            it "expect the attack_moves to be empty" do
                expect(queen.attack_moves).to be_empty
            end
        end
    end
end