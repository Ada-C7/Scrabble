module Scrabble

  class Board
    attr_reader :board

    def initialize
      @board = []
      make_new_board
    end

    def make_new_board
      15.times do
        @board << Array.new(15, nil)
      end
    end

  end
end

game_board = Scrabble::Board.new
print game_board.board
puts
puts  game_board.board.length
puts print game_board.board[2].length
