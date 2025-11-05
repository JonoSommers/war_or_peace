require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]
    
    @deck = Deck.new(@cards)
  end

  describe '#initialize' do
    it 'exists with attributes' do
      expect(@deck).to be_an_instance_of(Deck)
    end

    it 'has cards' do
      expect(@deck.cards).to eq([@card1, @card2, @card3])
    end
  end

  describe '#rankg_of_card_at' do
    it 'returns the rank of a card' do
      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
      expect(@deck.cards).to eq([@card1, @card2, @card3])
    end
  end

  describe '#high_ranking_cards' do
    it 'returns cards with a rank above 10' do
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end
  end

  describe '#percent_high_ranking' do
    it 'returns the percentage of high ranking cards in the deck' do
      expect(@deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do
    it 'removes and returns the first card in the deck' do
      expect(@deck.remove_card).to eq(@card1)
      expect(@deck.cards).to eq([@card2, @card3])
      expect(@deck.high_ranking_cards).to eq([@card3])
      expect(@deck.percent_high_ranking).to eq(50.00)
    end
  end

  describe '#add_card' do
    it 'adds a card to the end of the deck' do
      card4 = Card.new(:club, '5', 5)

      @deck.add_card(card4)

      expect(@deck.cards).to eq([@card1, @card2, @card3, card4])
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
      expect(@deck.percent_high_ranking).to eq(50.00)
    end
  end
end