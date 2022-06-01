class ComputerPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        p "Player #{@mark} chose #{pos}."
        pos
    end
end