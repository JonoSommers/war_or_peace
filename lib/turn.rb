class Turn

    attr_reader :player1, :player2, :spoils_of_war, :winner_name

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @winner_name = "Winner"
    end

    def type
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
            @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif 
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3
            :war
        elsif 
            @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
            :basic
        else
            @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            :basic
        end
    end

    def winner
        if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && 
            @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            "No Winner"
        elsif
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && 
            @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3 &&
            @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            @winner_name = @player1.name
            @player1
        elsif
            @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && 
            @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3 &&
            @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
            @winner_name = @player2.name
            @player2
        elsif
            @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @winner_name = @player1.name
            @player1
        else
            @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
            @winner_name = @player2.name
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
        # @spoils_of_war.shuffle!
        winner.deck.cards.concat(@spoils_of_war)
        @spoils_of_war.clear
    end
end

