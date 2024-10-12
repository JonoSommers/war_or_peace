class Turn

    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
            :basic
        elsif @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
            :basic
        elsif (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3)
            :mutually_assured_destruction
        else
            :war
        end
    end

    def winner
        if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
            @player1
        elsif
            @player2
        end
    end

    def pile_of_cards
        @spoils_of_war.push(@player1.deck.cards[0], @player2.deck.cards[0])
        @player1.deck.cards.shift
        @player2.deck.cards.shift
    end

    def award_spoils(winner)
        if winner 
            winner.deck.cards.concat(@spoils_of_war)
            @spoils_of_war.clear
        end
    end

end

