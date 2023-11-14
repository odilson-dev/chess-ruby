require_relative "../../lib/ai_computer_player"
RSpec.describe AI do
    let(:my_ai) { AI.new("Siri", "yellow") }
    
    describe "#convert_inverse" do
        
        context "When it receives a input of [7, 3]'" do
            it "returns 'd1'" do
                expect(my_ai.convert_inverse([7, 3])).to eq 'd1'
            end
        end

        context "When it receives a input of [7, 7]" do
            it "returns 'h1'" do
                expect(my_ai.convert_inverse([7, 7])).to eq 'h1'
            end
        end

        context "When it receives a input of [1, 4]" do
            it "returns 'e7'" do
                expect(my_ai.convert_inverse([1, 4])).to eq 'e7'
            end
        end

        context "When it receives a input of [4, 2]" do
            it "returns 'c4'" do
                expect(my_ai.convert_inverse([4, 2])).to eq 'c4'
            end
        end
    end
end