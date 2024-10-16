class Deck
    
    attr_reader :cards
    
    def initialize(cards)
        @cards = cards

    end

    def rank_of_card_at(index)

        @cards[index].rank
    end

    def high_ranking_cards
        @cards.find_all do |card|
            card.rank >= 11
        end
    end

    def percent_high_ranking
        percent_high = @cards.count do |card|
            card.rank >= 11
        end
        (percent_high.to_f / @cards.size * 100).round(2)
    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards.append(card)
    end
end