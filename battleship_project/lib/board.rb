require "byebug"

class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](position)
        row = position[0]
        column = position[1]
        @grid[row][column]
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        target = self[position]
        if target == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        n = @grid.length - 1
        all_ships = @size / 4
        ships = 0
        while ships < all_ships
            idx1 = rand(0..n)
            idx2 = rand(0..n)
            if @grid[idx1][idx2] != :S
                @grid[idx1][idx2] = :S
                ships += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        @grid.each_with_index do |row, idx1|
            hidden_row = []
            row.each_with_index do |ele, idx2|
                if ele == :S
                    hidden_row << :N
                else
                    hidden_row << ele
                end
            end
            hidden_grid << hidden_row
        end
        hidden_grid
    end

    def self.print_grid(grid_1)
        puts grid_1.map { |x| x.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
            
end
