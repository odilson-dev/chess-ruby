require_relative '../../../lib/pieces/knight.rb'

RSpec.describe Knight do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the knight is in the middle of the chessboard (eg: [4, 3])" do
            let(:knight) { Knight.new([4, 3], "White", "H") }
            moves_allowed = [[3,1], [2, 2], [5, 1], [6, 2], [2, 4], [3, 5], [5, 5], [6, 4]]
            it "The allowed moves are: [[3,1], [2, 2], [5, 1], [6, 2], [2, 4], [3, 5], [5, 5], [6, 4]]" do
                expect(knight.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is at the bottom of the chessboard(eg: [7, 4])" do
            let(:knight) { Knight.new([7, 4], "White", "H") }
            moves_allowed = [[6, 2], [5, 3], [5, 5], [6, 6]]
            it "The allowed moves are: [[6, 2], [5, 3], [5, 5], [6, 6]]" do
                expect(knight.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is at the corner of the chessboard (eg: [7, 7])" do
            let(:knight) { Knight.new([7, 7], "White", "H") }
            moves_allowed = [[5, 6], [6, 5]]
            it "The allowed moves are: [[5, 6], [6, 5]]" do
                expect(knight.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the knight is [1, 2])" do
            let(:knight) { Knight.new([1, 2], "White", "H") }
            moves_allowed = [[0, 0], [2, 0], [3, 1], [3, 3], [2, 4], [0, 4]]
            it "The allowed moves are: [[0, 0], [2, 0], [3, 1], [3, 3], [2, 4], [0, 4]]" do
                expect(knight.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end