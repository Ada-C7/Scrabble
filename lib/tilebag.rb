# require_relative '../lib/score'
# require_relative '../lib/player'

module Scrabble
  class Tilebag
    attr_reader :tilebag
    def initialize
      @tilebag = ["A","A","A","A","A","A","A","A","A","B","B","C","C","D","D","D","D","E","E","E","E","E","E","E","E","E","E","E","E","F","F","G","G","G","H","H","I","I","I","I","I","I","I","I","I","J","K","L","L","L","L","M","M","N","N","N","N","N","N","O","O","O","O","O","O","O","O","P","P","Q","R","R","R","R","R","R","S","S","S","S","T","T","T","T","T","T","U","U","U","U","V","V","W","W","X","Y","Y","Z"]
    end

    def get_remaining_tiles
      return @tilebag.length
    end

    def draw_tiles(num)
      @tilebag.shuffle!.pop(num)
    end
  end
end

#  scrabble = Scrabble::Tilebag.new
#  tilebag = scrabble.tilebag
# #print tilebag.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1}
#
# p Hash[tilebag.group_by(&:itself).map {|letter,value| [letter, value.length]}].sort
