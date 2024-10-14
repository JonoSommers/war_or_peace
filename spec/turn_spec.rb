require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    describe "#Initialize" do
        it "exists" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn).to be_a(Turn)
        end

        it "Has attributes" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.spoils_of_war).to eq([])
            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
        end
    end

    describe "Basic Turn" do
        describe "#type" do
            it "creates a basic turn type" do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])

                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)

                expect(turn.type).to be(:basic)
            end
        end

        describe "#winner" do    
            it "determines the winner of the turn" do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])

                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)

                expect(turn.winner).to eq(player1)
            end
        end
    
        describe "#pile_cards" do
            it "adds cards to the spoils_of_war array" do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])

                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)

                turn.pile_cards

                expect(turn.spoils_of_war).to eq([card1, card3])
            end
        end
    end

    describe "War Turn" do
        describe "#type" do
            it "creates a war turn type" do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)

                deck1 = Deck.new([card1, card2, card5, card8]) 
                deck2 = Deck.new([card4, card3, card6, card7])

                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)

                expect(turn.type).to be(:war)
            end
        end
    end

    describe "#award_spoils" do
        it "Adds cards from spoils_of_war array to the winner of the turns deck" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.award_spoils(winner)

            expect(player1.deck).to eq([card2, card5, card8, card1, card3])
            expect(player2.deck).to eq([card4, card6, card7])
        end
    end
end