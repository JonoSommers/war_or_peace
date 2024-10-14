require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    describe "#initialize" do
        it 'exists' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck).to be_a(Deck)
        end

        it 'has attributes' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.cards).to eq([card1, card2, card3])
        end
    end

    describe '#rank_of_card_at' do
        it 'returns rank of card at the specified index position' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
            expect(deck.cards).to eq([card1, card2, card3])
        end
    end

    describe '#high_ranking_cards' do
        it 'returns an array of cards with rankings >= 11' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end

        it 'updates the array when a card is removed' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
            deck.remove_card
            expect(deck.high_ranking_cards).to eq([card3])
        end
    end

    describe '#percent_high_ranking' do
        it 'returns a percentage of cards that are high ranking' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end

        it 'updates the percentage when a card is removed' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
            deck.remove_card
            expect(deck.percent_high_ranking).to eq(50.0)
        end

        it 'updates the percentage when a card is added' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
            deck.remove_card
            expect(deck.percent_high_ranking).to eq(50.0)
            deck.add_card(card4)
            expect(deck.percent_high_ranking).to eq(33.33)
        end
    end

    describe '#remove_card' do
        it 'returns a card that is removed from the top of the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.remove_card).to eq(card1)
            expect(deck.cards).to eq([card2, card3])
        end
    end

    describe '#add_card' do
        it 'adds a card to the bottom of the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)    
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5)
            cards = [card2, card3]

            deck = Deck.new(cards)
            deck.add_card(card4)
            expect(deck.cards).to eq([card2, card3, card4])
        end
    end
end





