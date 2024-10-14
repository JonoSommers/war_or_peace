require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    describe "#initialize" do
        it "exists" do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])

            player = Player.new('Clarisa', deck)
            expect(player).to be_a(Player)
        end

        it 'has attributes' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])

            player = Player.new('Clarisa', deck)
            expect(player.name).to eq('Clarisa')
            expect(player.deck).to be_a(Deck)
        end
    end

    describe "#has_lost?" do
        it 'determines if the player lost that round' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])

            player = Player.new('Clarisa', deck)
            expect(player.has_lost?).to be(false)
            player.deck.remove_card
            expect(player.has_lost?).to be(false)
            player.deck.remove_card
            expect(player.has_lost?).to be(false)
            player.deck.remove_card
            expect(player.has_lost?).to be(true)
            expect(player.deck.cards).to eq([])
        end
    end
end