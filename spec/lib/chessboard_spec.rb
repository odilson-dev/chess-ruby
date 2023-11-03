require_relative '../../lib/chessboard.rb'
require_relative '../../lib/pieces/king.rb'

RSpec.describe ChessBoard do
    subject {chessboard_1 = ChessBoard.new}
    describe "#add" do
        king = King.new([3, 7], "white")
        context "The method #add adds a piece on the chessboard by giving the piece instance as parameter" do
            before do
                subject.add(king)
            end
            it "Adds the piece king at the position [3, 7] on the board" do
                expect(subject[3][7]).to be king
            end

            it "The position [3, 7] on the chessboard is not nil" do
                expect(subject[3][7]).to_not be_nil
            end
        end
    end
end