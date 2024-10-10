require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'exists' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:diamond, 'Queen', 12)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'returns rank of card at specified index position' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:diamond, 'Queen', 12)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(12)
    end
end





