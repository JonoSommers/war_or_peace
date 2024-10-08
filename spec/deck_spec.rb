require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
    describe 'initialize' do
        it 'should start as an empty array of cards' do
            deck = Deck.new([])

            expect(deck.cards).to eq([])
        end
    end

    describe 'add_cards' do
        it 'should be able to add cards to the cards array' do
            deck = Deck.new([])

            card1 = deck.add_card(:diamond, 'Queen', 12)
            card2 = deck.add_card(:spade, '3', 3)
            card3 = deck.add_card(:heart, 'Ace', 14)

            expect(deck.cards).to eq([card1, card2, card3])
        end
    end
end
