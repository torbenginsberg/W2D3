require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(n, *mark_values)
        @players = mark_values.map { |mark| HumanPlayer.new(mark) }
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            target = @current_player.get_position
            current_mark = @current_player.mark
            @board.place_mark(target, current_mark)
            if @board.win?(current_mark)
                p "Victory! Player #{current_mark} has won!"
                return
            else
                self.switch_turn
            end
        end

        p "The game has ended in a draw. Well played."
    end
end