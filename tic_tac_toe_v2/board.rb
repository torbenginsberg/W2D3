class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
        @n = n
        @size = n * n
    end

    def valid?(position)
        row, col = position
        row >= 0 && row < @n && col >= 0 && col < @n
    end

    def empty?(position)
        row, col = position
        @grid[row][col] == "_"
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise ArgumentError.new "The position is not valid"
        elsif !empty?(position)
            raise ArgumentError.new "The position is already filled."
        else
            row, col = position
            @grid[row][col] = mark
        end
    end

    def print
        puts @grid.map { |row| row.join("  ") }
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |ele| ele == mark }
        end
        false
    end

    def win_col?(mark)
        i = 0
        while i < @grid.length
            col_nums = []
            @grid.each { |row| col_nums << row[i] }
            return true if col_nums.all? { |ele| ele == mark }
            i += 1
        end
        false
    end

    def win_diagonal?(mark)
        front_diagonal = []
        back_diagonal = []

        col = @grid.length - 1
        row = 0
        while row < @grid.length
            front_diagonal << @grid[row][row]
            back_diagonal << @grid[row][col]
        row += 1
        col -= 1
        end

        front_diagonal.all? { |ele| ele == mark } || back_diagonal.all? { |ele| ele == mark }
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |ele| ele == "_" }
    end
end