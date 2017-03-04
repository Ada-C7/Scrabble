module Scrabble
  class Board
    attr_reader :board
    def initialize
      @board = create_new_board
    end

    def create_new_board
      @board = Array.new(15) {Array.new(15, "[ ]")}
    end

    def display_board
      n = 1
      @board.each do |x|
        print n
        x.each do |cell|
          print cell
        end
        puts
        n += 1
      end
    end

    def check_word_on_board(word, row, col, direction)
      if (row > 15 || row < 1) || (col > 15 || col < 1)
        raise ArgumentError.new("Row and colon must be between 1 and 15")
      end
      if (word.class != String) || (direction.class != String)
          raise ArgumentError.new("Word and direction must be string!")
      end
      case direction
      when "up"
        row - word.length >= 0 ? true : false
      when "down"
        row + word.length <= 16 ? true : false
      when "right"
        col + word.length <= 16 ? true : false
      when "left"
        col - word.length >= 0 ? true : false
      end
    end
  end # end of class
end # end of Module
b = Scrabble::Board.new
b.create_new_board
b.display_board
puts b.check_word_on_board("apple", 5, 6, "up")
puts b.check_word_on_board("apple", 11, 6, "down")
puts b.check_word_on_board("apple", 11, 11, "right")
puts b.check_word_on_board("apple", 7, 4, "left")
