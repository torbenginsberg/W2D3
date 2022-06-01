class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position
        p "#{@mark}. Please enter a board position as two numbers with a space in between."
        input_position = gets.chomp
        arr = input_position.split
        if arr.length != 2
            raise ArgumentError "Too many or too few inputs"
        end
        arr.each do |ele|
            if ele.to_i.to_s != ele
                raise ArgumentError "Inputs can only be integers"
            end
        end
        arr.map{ |ele| ele.to_i }
    end
end