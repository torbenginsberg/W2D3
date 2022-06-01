require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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