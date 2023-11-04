require_relative '../../../lib/pieces/queen.rb'

RSpec.describe Queen do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the queen is in the middle of the chessboard (eg: [4, 3])" do
            let(:queen) { Queen.new([4, 3], "White", "H") }
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
            let(:queen) { Queen.new([7, 3], "White", "H") }
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
            let(:queen) { Queen.new([0, 0], "White", "H") }
            moves_allowed = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                            [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                            [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
            it "The allowed moves are: [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
            [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]" do
                expect(queen.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end