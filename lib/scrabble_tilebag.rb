module Scrabble

  class TileBag
    attr_reader :bag_of_tiles

    def initialize

      @bag_of_tiles = shuffle_tiles
      #sets up a collection of all default tiles

    end

    TILE_HASH = {
      "A" => 9, "N" => 6,
      "B" => 2, "O" => 8,
      "C" => 2, "P" => 2,
      "D" => 4, "Q" => 1,
      "E" => 12, "R" => 6,
      "F" => 2, "S" => 4,
      "G" => 3, "T" => 6,
      "H" => 2, "U" => 4,
      "I" => 9, "V" => 2,
      "J" => 1, "W" => 2,
      "K" => 1, "X" => 1,
      "L" => 4, "Y" => 2,
      "M" => 2, "Z" => 1
    }

    def draw_tiles(num)
      new_tiles = []
      num.times {new_tiles << @bag_of_tiles.pop }
      return new_tiles
      #returns a collection of num random tiles
      #updates set in tilebag instance.
      #also may eventually update tiles in player hand
    end

    def tiles_remaining
      #returns the remaining tiles in bag.
      #accesses array and puts or prints it.
    end

    def shuffle_tiles
      tile_array = []
      TILE_HASH.each do |letter, number|
        number.times { tile_array << letter}
      end
      tile_array.shuffle!
    end
  end

end
