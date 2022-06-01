class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        p "#{@mark}. Please enter a board position as two numbers with a space in between."
        begin
            input_position = gets.chomp.split
            pos = input_position.map{ |ele| ele.to_i }
            if !legal_positions.include?(pos)
                raise "This is not a legal position."
            end
            return pos
        rescue
            puts "Please try again. Make sure you are entering a legal position."
            retry
        end
    end
end