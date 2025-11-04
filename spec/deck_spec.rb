require 'rspec'
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
      expect(@deck.cards).to eq([])
    end
  end
end