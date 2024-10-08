class Deck

    attr_reader :cards
    
    def initialize
        @cards = []
    end

    def add_cards(card)
        @cards << card
    end
end
