require_relative '../../../lib/pieces/king.rb'

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
                expect(king.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the king is at the bottom of the chessboard(eg: [4, 1])" do
            let(:king) { King.new([4, 1], "White") }
            moves_allowed = [[3,1], [3, 2], [4, 2], [5,2], [5, 1]]
            it "The allowed moves are: [[3,1], [3, 2], [4, 2], [5,2], [5, 1]]" do
                expect(king.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the king is at the corner of the chessboard (eg: [8, 8])" do
            let(:king) { King.new([8, 8], "White") }
            moves_allowed = [[7, 8], [7, 7], [8, 7]]
            it "The allowed moves are: [[7, 8], [7, 7], [8, 7]]" do
                expect(king.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end