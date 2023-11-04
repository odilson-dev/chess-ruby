require_relative '../../../lib/pieces/bishop.rb'

RSpec.describe Bishop do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the bishop is in the middle of the chessboard (eg: [4, 3])" do
            let(:bishop) { Bishop.new([4, 3], "White", "H") }
            moves_allowed = [[1, 0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
                            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7]]
            it "The allowed moves are: [[1, 0], [2, 1], [3, 2],[5, 4], [6, 5], [7, 6],
            [7, 0], [6, 1], [5, 2], [3, 4], [2, 5], [1, 6], [0, 7]]" do
                expect(bishop.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the bishop is at the bottom of the chessboard(eg: [7, 3])" do
            let(:bishop) { Bishop.new([7, 3], "White", "H") }
            moves_allowed = [[4, 0], [5, 1], [6, 2],[6, 4], [5, 5], [4, 6], [3, 7]]
            it "The allowed moves are: [[4, 0], [5, 1], [6, 2], [6, 4], [5, 5], [4, 6], [3, 7]]" do
                expect(bishop.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the bishop is at the corner of the chessboard (eg: [7, 7])" do
            let(:bishop) { Bishop.new([7, 7], "White", "H") }
            moves_allowed = [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]
            it "The allowed moves are: [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6]]" do
                expect(bishop.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end