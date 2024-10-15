require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


suits = [:heart, :diamond, :spade, :club]

deck_of_all_cards = []

suits.each do |suit|
    deck_of_all_cards << Card.new(suit, "2", 2)
    deck_of_all_cards << Card.new(suit, "3", 3)
    deck_of_all_cards << Card.new(suit, "4", 4)
    deck_of_all_cards << Card.new(suit, "5", 5)
    deck_of_all_cards << Card.new(suit, "6", 6)
    deck_of_all_cards << Card.new(suit, "7", 7)
    deck_of_all_cards << Card.new(suit, "8", 8)
    deck_of_all_cards << Card.new(suit, "9", 9)
    deck_of_all_cards << Card.new(suit, "10", 10)
    deck_of_all_cards << Card.new(suit, "Jack", 11)
    deck_of_all_cards << Card.new(suit, "Queen", 12)
    deck_of_all_cards << Card.new(suit, "King", 13)
    deck_of_all_cards << Card.new(suit, "Ace", 14)
    deck_of_all_cards.shuffle!
end

deck1 = Deck.new(deck_of_all_cards.shift(26))
deck2 = Deck.new(deck_of_all_cards.shift(26))

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)
game = Game.new(player1, player2, turn)



p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

if gets.chomp == "GO"
    game.start
end
