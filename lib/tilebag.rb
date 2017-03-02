require_relative '../lib/score'
require_relative '../lib/player'

module Scrabble
  class Tilebag
    attr_reader :tilebag
   def initialize
     @tilebag = ["A","A","A","A","A","A","A","A","A"]
   end

   def get_remaining_tiles
     return @tilebag.length
   end

    def draw_tiles(num)
      @tilebag.shuffle!.pop(num)
    end


  end
end
