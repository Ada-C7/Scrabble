module Scrabble

class Board

  def initialize
    @board = []
    15.times do
      board << ["_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"]
    end
  end

  def check_word_play
    # Check if a word can be played on a given tile place in a certain direction (up/down or left/right).
  end


end

end
