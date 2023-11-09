require_relative '../../../lib/pieces/pawn.rb'

RSpec.describe Pawn do
    RSpec::Matchers.define :be_same_as do |second_array|
        match do |first_array|
          first_array.length == second_array.length ? first_array.map { |position| second_array.include? position }.all? : false
        end
    end
    describe "#allowed_moves" do
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 3])" do
            let(:pawn) { Pawn.new([4, 3], "white") }
            moves_allowed = [[3, 3]]
            it "The allowed moves are: [[3, 3]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the white pawn is on the second line, point of view of the owner (eg: [6, 5])" do
            let(:pawn) { Pawn.new([6, 5], "white") }
            moves_allowed = [[5, 5], [4, 5]]
            it "The allowed moves are: [[5, 5], [4, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the black pawn is in the middle of the chessboard (eg: [4, 3])" do
            let(:pawn) { Pawn.new([4, 3], "black") }
            moves_allowed = [[5, 3]]
            it "The allowed moves are: [[5, 3]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
        end


        context "When the position of the black pawn is on the second line, point of view of the owner (eg: [1, 4])" do
            let(:pawn) { Pawn.new([1, 4], "black") }
            moves_allowed = [[2, 4], [3, 4]]
            it "The allowed moves are: [[2, 4], [3, 4]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
        end

        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 3]), and there is 1 black pawn in front of him" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([3, 2], "black", chessboard_1)
                chessboard_1.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([4, 2], "white", chessboard_1) }
            
            it "expects the allowed moves to be empty" do
                expect(pawn.allowed_moves).to be_empty
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 2]), and there is 1 white pawn in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([3, 2], "white", chessboard_2)
                chessboard_2.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([4, 2], "white", chessboard_2)}
            
            it "expects the allowed moves to be empty" do
                expect(pawn.allowed_moves).to be_empty
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        
        context "When the position of the white pawn is on the second row by the point of view of the owner(eg: [6, 5]), and there is 1 black pawn one square in front of him" do
                let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([4, 5], "black", chessboard_1)
                chessboard_1.add(pawn_1)
            end
                    
    
            let(:pawn) { Pawn.new([6, 5], "white", chessboard_1) }
            
            it "expects the allowed moves to be empty" do
                allowed_moves = [[5, 5]]
                expect(pawn.allowed_moves).to eq allowed_moves
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end

        context "When the position of the white pawn is on the second row by the point of view of the owner(eg: [6, 5]), and there is 1 white pawn one square in front of him" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([4, 5], "white", chessboard_1)
                chessboard_1.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([6, 5], "white", chessboard_1) }
            
            it "expects the allowed moves to be empty" do
                allowed_moves = [[5, 5]]
                expect(pawn.allowed_moves).to eq allowed_moves
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end

        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 black pawn in front of him" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([4, 4], "black", chessboard_1)
                chessboard_1.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([3, 4], "black", chessboard_1) }
            
            it "expects the allowed moves to be empty" do
                expect(pawn.allowed_moves).to be_empty
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 white pawn in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([4, 4], "white", chessboard_2)
                chessboard_2.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([3, 4], "black", chessboard_2)}
            
            it "expects the allowed moves to be empty" do
                expect(pawn.allowed_moves).to be_empty
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
            
        context "When the position of the black pawn is on the second row by the point of view of the owner(eg: [6, 5]), and there is 1 black pawn one square in front of him" do
                let(:chessboard_1) { ChessBoard.new }
                before do
                    pawn_1 = Pawn.new([3, 5], "black", chessboard_1)
                    chessboard_1.add(pawn_1)
                end
                    
    
                let(:pawn) { Pawn.new([1, 5], "black", chessboard_1) }
                
                it "expects the allowed moves to eq [2, 5]" do
                    allowed_moves = [[2, 5]]
                    expect(pawn.allowed_moves).to eq allowed_moves
                end
        
                it "expects the attack moves to be empty" do
                    expect(pawn.attack_moves).to be_empty
                end
            end
        context "When the position of the black pawn is on the second row by the point of view of the owner(eg: [1, 5]), and there is 1 white pawn one square in front of him" do
            let(:chessboard_1) { ChessBoard.new }
            before do
                pawn_1 = Pawn.new([3, 5], "white", chessboard_1)
                chessboard_1.add(pawn_1)
            end
                

            let(:pawn) { Pawn.new([1, 5], "black", chessboard_1) }
            
            it "expects the allowed moves to eq [2, 5]" do
                allowed_moves = [[2, 5]]
                expect(pawn.allowed_moves).to eq allowed_moves
            end
    
            it "expects the attack moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end

        # # Test the attack's moves value for white pawns

        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 2]), and there is 1 white pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([3, 1], "white", chessboard_2)
                pawn_2 = Pawn.new([3, 3], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([4, 2], "white", chessboard_2) }

            moves_allowed = [[3, 2]]

            it "The allowed moves are: [[3, 2]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 2]), and there is 1 black pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([3, 1], "black", chessboard_2)
                pawn_2 = Pawn.new([3, 3], "black", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([4, 2], "white", chessboard_2) }

            moves_allowed = [[3, 2]]

            it "The allowed moves are: [[3, 2]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[3, 1], [3, 3]]
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 2]), and there is 1 white pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([3, 1], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
            end
            let(:pawn) { Pawn.new([4, 2], "white", chessboard_2) }

            moves_allowed = [[3, 2]]

            it "The allowed moves are: [[3, 2]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the white pawn is in the middle of the chessboard (eg: [4, 2]), and there is 1 black pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_2 = Pawn.new([3, 3], "black", chessboard_2)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([4, 2], "white", chessboard_2) }

            moves_allowed = [[3, 2]]

            it "The allowed moves are: [[3, 2]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[3, 3]]
            it "expect the attack_moves = [3, 3]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end

        # # When the white pawn is on the second row by the point of view of the owner

        context "When the position of the white pawn is on the second row by the point of view of the owner (eg: [6, 5]), and there is 1 white pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([5, 4], "white", chessboard_2)
                pawn_2 = Pawn.new([5, 6], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([6, 5], "white", chessboard_2) }

            moves_allowed = [[5,5], [4, 5]]

            it "The allowed moves are: [[5,5], [4, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the white pawn is on the second row by the point of view of the owner (eg: [6, 5]), and there is 1 black pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([5, 4], "black", chessboard_2)
                pawn_2 = Pawn.new([5, 6], "black", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([6, 5], "white", chessboard_2) }

            moves_allowed = [[5,5], [4, 5]]

            it "The allowed moves are: [[5,5], [4, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end

            attack_moves = [[5, 4], [5, 6]]
            it "expect the attack_moves to eq [[5, 4], [5, 6]]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the white pawn is on the second row by the point of view of the owner (eg: [6, 5]), and there is 1 white pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([5, 4], "white", chessboard_2)
                chessboard_2.add(pawn_1)
                
            end
            let(:pawn) { Pawn.new([6, 5], "white", chessboard_2) }

            moves_allowed = [[5,5], [4, 5]]

            it "The allowed moves are: [[5,5], [4, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end

        context "When the position of the white pawn is on the second row by the point of view of the owner (eg: [6, 5]), and there is 1 black pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([5, 4], "black", chessboard_2)
                chessboard_2.add(pawn_1)
                
            end
            let(:pawn) { Pawn.new([6, 5], "white", chessboard_2) }

            moves_allowed = [[5,5], [4, 5]]

            it "The allowed moves are: [[5,5], [4, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[5, 4]]
            it "expect the attack_moves to eq [5, 4]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end

        # # Test the attack's moves value for black pawns

        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 white pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([4, 3], "white", chessboard_2)
                pawn_2 = Pawn.new([4, 5], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([3, 4], "black", chessboard_2) }

            moves_allowed = [[4, 4]]

            it "The allowed moves are: [[4, 4]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[4, 3], [4, 5]]
            it "expect the attack_moves to eq [4, 3], [4, 5]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end
        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 black pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([4, 3], "black", chessboard_2)
                pawn_2 = Pawn.new([4, 5], "black", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([3, 4], "black", chessboard_2) }

            moves_allowed = [[4, 4]]

            it "The allowed moves are: [[4, 4]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 white pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([4, 3], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
            end
            let(:pawn) { Pawn.new([3, 4], "black", chessboard_2) }

            moves_allowed = [[4, 4]]

            it "The allowed moves are: [[4, 4]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[4, 3]]
            it "expect the attack_moves to eq [4, 3]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end
        context "When the position of the black pawn is in the middle of the chessboard (eg: [3, 4]), and there is 1 black pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([4, 5], "black", chessboard_2)
                chessboard_2.add(pawn_1)
            end
            let(:pawn) { Pawn.new([3, 4], "black", chessboard_2) }

            moves_allowed = [[4, 4]]

            it "The allowed moves are: [[4, 4]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            attack_moves = [[4, 3]]
            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end

        # When the black pawn is on the second row by the point of view of the owner

        context "When the position of the black pawn is on the second row by the point of view of the owner (eg: [1, 5]), and there is 1 white pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([2, 4], "white", chessboard_2)
                pawn_2 = Pawn.new([2, 6], "white", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([1, 5], "black", chessboard_2) }

            moves_allowed = [[2, 5], [3, 5]]

            it "The allowed moves are: [[2, 5], [3, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end

            attack_moves = [[2, 4], [2, 6]]
            it "expect the attack_moves to eq [2, 4], [2, 6]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end
        context "When the position of the black pawn is on the second row by the point of view of the owner (eg: [1, 5]), and there is 1 black pawn on both diagonal squares in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([2, 4], "black", chessboard_2)
                pawn_2 = Pawn.new([2, 6], "black", chessboard_2)
            
                chessboard_2.add(pawn_1)
                chessboard_2.add(pawn_2)
            end
            let(:pawn) { Pawn.new([1, 5], "black", chessboard_2) }

            moves_allowed = [[2, 5], [3, 5]]

            it "The allowed moves are: [[2, 5], [3, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end

            it "expect the attack_moves to be empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
        context "When the position of the black pawn is on the second row by the point of view of the owner (eg: [1, 5]), and there is 1 white pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([2, 4], "white", chessboard_2)
                chessboard_2.add(pawn_1)
            end
            let(:pawn) { Pawn.new([1, 5], "black", chessboard_2) }

            moves_allowed = [[2, 5], [3, 5]]

            it "The allowed moves are: [[2, 5], [3, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end

            attack_moves = [[2, 4]]
            it "expect the attack_moves to eq [[2, 4]]" do
                expect(pawn.attack_moves).to be_same_as attack_moves
            end
        end

        context "When the position of the black pawn is on the second row by the point of view of the owner (eg: [1, 5]), and there is 1 black pawn on one diagonal square in front of him" do
            let(:chessboard_2) { ChessBoard.new }
            
            before do
                pawn_1 = Pawn.new([2, 6], "black", chessboard_2)
                chessboard_2.add(pawn_1)
            end
            let(:pawn) { Pawn.new([1, 5], "black", chessboard_2) }

            moves_allowed = [[2, 5], [3, 5]]

            it "The allowed moves are: [[2, 5], [3, 5]]" do
                expect(pawn.allowed_moves).to be_same_as moves_allowed
            end
            it "expect the attack_moves to be_empty" do
                expect(pawn.attack_moves).to be_empty
            end
        end
    end
end
