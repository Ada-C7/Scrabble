module Scrabble
  class TileBag
    attr_reader :tiles, :drawn_tiles


    def initialize
      #instance with collection of all default tiles
      @tiles = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T","T", "T", "T","U","U","U","U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
    end

    def draw_tiles(num)
      #returns collection of random tiles
      #removes tiles from the default set
      @drawn_tiles = @tiles.shuffle!.pop(num)
    end

    def tiles_remaining
      #returns the number of tiles remaining in the bag
      @tiles.length
    end
  end
end
