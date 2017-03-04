module Scrabble
  class TileBag
    attr_reader :tiles
    # Instance variable stores the appropriate number of each letters in an array
    def initialize
      @tiles = ["A"]*9 + ["B"]*2 + ["C"]*2 + ["D"]*4 + ["E"]*12 + ["F"]*2 + ["G"]*3 + ["H"]*2 + ["I"]*9 + ["J"]*1 + ["K"]*1 + ["L"]*4 + ["M"]*2 + ["N"]*6 + ["O"]*8 + ["P"]*2 + ["Q"]*1 + ["R"]*6 + ["S"]*4 + ["T"]*6 + ["U"]*4 + ["V"]*2 + ["W"]*2 + ["X"]*1 + ["Y"]*2 + ["Z"]*1

      # Randomize the tiles
      @tiles.shuffle!
    end

    def draw_tiles(num)
      # Parameter must be an integer
      raise ArgumentError.new("Invalid parameter data type: must be an integer") if num.class != Integer

      # Removes the drawn tiles from the tile bag
      @tiles.shift(num)
    end

    def tiles_remaining
      # Returns the remaining tile count
      @tiles.count
    end
  end
end
