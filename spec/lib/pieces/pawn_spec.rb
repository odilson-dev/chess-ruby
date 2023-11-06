require_relative '../../../lib/pieces/pawn.rb'

RSpec.describe Pawn do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
      end
    describe "#find_allowed_moves" do
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 3])" do
            let(:pawn) { Pawn.new([4, 3], "white") }
            moves_allowed = [[3, 3]]
            it "The allowed moves are: [[3, 3]]" do
                expect(pawn.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the white pawn is on the second line, point of view of the owner (eg: [6, 5])" do
            let(:pawn) { Pawn.new([6, 5], "white") }
            moves_allowed = [[5, 5], [4, 5]]
            it "The allowed moves are: [[5, 5], [4, 5]]" do
                expect(pawn.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the black pawn is in the middle of the chessboard (eg: [4, 3])" do
            let(:pawn) { Pawn.new([4, 3], "black") }
            moves_allowed = [[5, 3]]
            it "The allowed moves are: [[5, 3]]" do
                expect(pawn.find_allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the black pawn is on the second line, point of view of the owner (eg: [1, 4])" do
            let(:pawn) { Pawn.new([1, 4], "black") }
            moves_allowed = [[2, 4], [3, 4]]
            it "The allowed moves are: [[2, 4], [3, 4]]" do
                expect(pawn.find_allowed_moves).to be_same_as moves_allowed
            end
        end
    end
end