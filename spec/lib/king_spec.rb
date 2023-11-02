require_relative ''

describe Kind do
    describe "#find_allowed_moves" do
        context "When the position of the king is [5,5]" do
            let(:king) { King.new([5, 5], "White", "H") }
            moves_allowed = [[5,6], [5, 4], [4, 4], [4, 5], [4, 6], [6, 4], [6, 5], [6, 6]]
            it "is equal to moves_allowed" do
                expect(king.find_allowed_moves).to eq moves_allowed
            end
        end

        context "When the position of the king is [4, 1]" do
            let(:king) { King.new([4, 1], "White", "H") }
            moves_allowed = [[3,1], [3, 2], [4, 2], [5,2], [5, 1]]
            it "is equal to moves_allowed" do
                expect(king.find_allowed_moves).to eq moves_allowed
            end
        end

        context "When the position of the king is [8, 8]" do
            let(:king) { King.new([8, 8], "White", "H") }
            moves_allowed = [[7, 8]. [7, 7], [8, 7]]
            it "is equal to moves_allowed" do
                expect(king.find_allowed_moves).to eq moves_allowed
            end
        end
    end
end