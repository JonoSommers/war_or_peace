class Turn

    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) &&
            (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
            :mutually_assured_destruction
        elsif 
            (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank)
            (@player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3)
            :war
        elsif 
            @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
            :basic
        else
            @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
            :basic
        end
    end

    def winner
        if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && 
            (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
            "No Winner"
        elsif
            @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && 
            @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3 &&
            @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
            @player1
        elsif
            @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && 
            @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3 &&
            @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
            @player2
        elsif
            @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
            @player1
        else
            @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
            @player2
        end
    end

    def pile_cards
        if type == :mutually_assured_destruction
            @spoils_of_war.concat(@player1.deck.cards.shift(3))
            @spoils_of_war.concat(@player2.deck.cards.shift(3))
            @spoils_of_war.clear
        elsif
            type == :war
            @spoils_of_war.concat(@player1.deck.cards.shift(3))
            @spoils_of_war.concat(@player2.deck.cards.shift(3))
        else type == :basic
            @spoils_of_war.concat(@player1.deck.cards.shift(1)) 
            @spoils_of_war.concat(@player2.deck.cards.shift(1))
        end
    end

    def award_spoils(winner)
        winner.deck.cards.concat(@spoils_of_war)
        @spoils_of_war.clear
    end
end

