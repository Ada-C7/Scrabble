module Scrabble
  class Board
    attr_reader :board

    def initialize
      @board = Array.new(15) { Array.new(15,"▢") }
    end

    def display
      puts [1,3,5,7,9,11,13,15].map{|num| num.to_s.ljust(4," ")}.join
      @board.each_with_index {
        |row, index| puts "#{row.join(" ")} #{index + 1 if (index + 1) % 2 != 0}"
      }
      puts
    end

    def place_word(turn)
      # Coordinates are zero-indexed, with x as the column and y as the row
      x = turn[:column] - 1
      y = turn[:row] - 1

      unless ['down', 'right'].include? turn[:direction].downcase
        raise ArgumentError.new("Direction must be 'down' or 'right'.")
      end

      turn[:word].upcase!
      turn[:word].length.times do |index|
        @board[y][x] = turn[:word].chars[index]
        turn[:direction] == 'down' ? y += 1 : x += 1
      end
    end

    def tiles_needed(turn)
      x = turn[:column] - 1
      y = turn[:row] - 1

      tiles = []
      turn[:word].length.times do |index|
        tiles << turn[:word][index] if @board[y][x] == "▢"
        turn[:direction] == 'down' ? y += 1 : x += 1
      end
      tiles
    end

    def space_available?(turn)
      x = turn[:column] - 1
      y = turn[:row] - 1

      turn[:word].length.times do |index|
        return false if @board[y][x] != "▢" && @board[y][x] != turn[:word][index]
        turn[:direction] == 'down' ? y += 1 : x += 1
      end
      true
    end

  end
end
