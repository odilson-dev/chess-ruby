require_relative "../../lib/game"
RSpec.describe ChessGame do
    let(:game) { ChessGame.new }
    
    describe "#convert" do
        
        context "When it receives a input of 'd1'" do
            it "returns [7, 3]" do
                expect(game.convert('d1')).to eq [7, 3]
            end
        end

        context "When it receives a input of 'h1'" do
            it "returns [7, 7]" do
                expect(game.convert('h1')).to eq [7, 7]
            end
        end

        context "When it receives a input of 'e7'" do
            it "returns [1, 4]" do
                expect(game.convert('e7')).to eq [1, 4]
            end
        end

        context "When it receives a input of 'c4'" do
            it "returns [4, 2]" do
                expect(game.convert('c4')).to eq [4, 2]
            end
        end
    end
end