
require 'terminal-table'

module Scrabble
  class Board
    attr_reader :table
    def initialize
    @heading = %w( - A B C D E F G H I J K L M N O)
    @board_array = [
      [ 1, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 2, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 3, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 4, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 5, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 6, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 7, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 8, " ", " ", " ", " ", " ", " ", " ", "+", " ", " ", " ", " ", " ", " ", " " ],
      [ 9, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 10, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 11, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 12, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 13, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 14, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
      [ 15, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " " ],
    ]
    end

    def show_table
      table = Terminal::Table.new :title => "SCRABBLE BOARD", :headings => @heading, :rows => @board_array
      table.style = {:all_separators => true}
      return table
    end

    def place_character(letter, tile_ref) #'w', A9
      @board_array[(tile_ref[1].to_i)-1][@heading.index(tile_ref[0])] = letter
      # use first letter to find the index number from @heading
    end
      # raise ArgumentError if start_tile != " "
      # raise ArgumentError if end_tile != " "
      # take care of placing each letter on the board (each_char)
      # 2nd letter will determine the direction
      # if letter is placed in B2 the next letter can only be placed in A1, A2, A3, B1, B3, C1, C2, C3
  end
end

board = Scrabble::Board.new
board.place_character("A", "A9")
puts board.show_table
