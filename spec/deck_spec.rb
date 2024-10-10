require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'exists' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'returns rank of card at specified index position' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(12)
    end

    it 'returns rank of card at specified index position' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'returns an array of cards with rankings >= 11' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it 'returns a percentage of cards that are high ranking' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)    
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.percent_high_ranking).to eq(66.67)
    end

end





