require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board
    
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            true
        else
            false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        @remaining_misses -= 1 if !@board.attack(@player.get_move)
        @board.print
        p @remaining_misses
    end
end
