class Game
    attr_reader :player1, :player2, :turn
    
    def initialize(player1, player2, turn)
        @player1 = player1
        @player2 = player2
        @turn = turn
        @turn_count = 0
    end

    def start
        until @player1.has_lost? == true || @player2.has_lost? == true || @turn_count == 1000000
            #@turn = Turn.new(player1, player2)
            @turn.type
            @turn.winner
            @turn.pile_cards
            @turn.spoils_of_war
            puts "Turn #{@turn_count} #{@turn.type} #{@turn.winner_name}."
            @turn_count += 1
        end
        has_won?
    end

    def has_won?
        if (@player1.deck.cards.count >= 3) && 
            (@player2.deck.cards.count < 3)
            @player1.has_won == true
            puts "Player1 Wins!"
        elsif
            (@player2.deck.cards.count >= 3) &&
            (@player1.deck.cards.count < 3)
            @player2.has_won == true
            puts "Player2 Wins!"
        else
            puts 'DRAW'
        end     
    end
end