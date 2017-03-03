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

    def check_playable(word, starting_row, starting_col , direction)
      playable = true
      case direction
      when "right"
        word.length.times do |n|
          return false if (starting_col + n) > 14
          playable = false if board[starting_row][starting_col + n] != nil
        end
      when "left"
        word.length.times do |n|
          return false if (starting_col - n) < 0
          playable = false if board[starting_row][starting_col - n] != nil
        end
      when "up"
        word.length.times do |n|
          return false if (starting_row - n) < 0
          playable = false if board[starting_row - n][starting_col] != nil
        end
      when "down"
        word.length.times do |n|
          return false if (starting_row + n) > 14
          playable = false if board[starting_row + n][starting_col] != nil
        end
      end
      return playable
    end



    def play(word, starting_row, starting_col , direction)
      if check_playable(word, starting_row, starting_col , direction)

        case direction
        when "right"
          word.length.times do |n|
            board[starting_row][starting_col + n] = word[n]
          end

        when "left"
          word.length.times do |n|
            board[starting_row][starting_col - n] = word[n]
          end

        when "up"
          word.length.times do |n|
            board[starting_row - n][starting_col] = word[n]
          end

        when "down"
          word.length.times do |n|
            board[starting_row + n][starting_col] = word[n]
          end
        end

      end

      return board
    end



  end
end










game_board = Scrabble::Board.new
game_board.play("word", 0, 0 , "right")
game_board.play("thingy", 1, 0 , "down")
game_board.play("hidden", 10, 10 , "up").each do |row|
print  row
puts
end


#
# puts
# puts
# print game_board.play("th", 1, 0 , "down")
#
# #  print game_board.board
# #  puts
# #  puts  game_board.board.length
# # print game_board.board[2].length
