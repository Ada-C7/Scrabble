require_relative 'scoring'
require_relative 'player'
module Scrabble
  class TileBag
    attr_reader :tile_bag

    def initialize
      @tile_bag = [ "A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C",
                  "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E",
                  "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H",
                  "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L",
                  "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O",
                  "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R",
                  "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T",
                  "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y",
                  "Y", "Z" ].shuffle
    end

    def draw_tiles(num)
      raise ArgumentError unless num.class == Integer
      @tile_bag.pop(num)
    end

    def tiles_remaining
      @tile_bag.length
    end
  end
end
