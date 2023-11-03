require_relative '../../../lib/pieces/rook.rb'

RSpec.describe Rook do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the rook is in the middle of the chessboard (eg: [3, 3])" do
            let(:rook) { Rook.new([3, 3], "White", "H") }
            moves_allowed = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3], [3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7]]
            it "The allowed moves are: [[0, 3], [1, 3] [2, 3], [4, 3], [5, 3], [6, 3], [7, 3], [3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7]]" do
                expect(rook.find_allowed_moves).to eq moves_allowed
            end
        end

        context "When the position of the rook is at the bottom of the chessboard(eg: [7, 4])" do
            let(:rook) { Rook.new([7, 4], "White", "H") }
            moves_allowed = [[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4],
            [6, 4], [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6],[7, 7]]
            it "The allowed moves are: [[0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4],
            [6, 4], [7, 0], [7, 1], [7, 2], [7, 3], [7, 5], [7, 6],[7, 7]]" do
                expect(rook.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the king is at the corner of the chessboard (eg: [7, 7])" do
            let(:rook) { Rook.new([7, 7], "White", "H") }
            moves_allowed = [[0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7],
                            [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]]
            it "The allowed moves are: [[0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6]]" do
                expect(rook.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end