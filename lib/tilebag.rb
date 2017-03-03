module Scrabble
  class TileBag

    attr_reader :tile_set

    ORIGINAL_TILE_SET = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
    }

    def initialize
      @tile_set = new_tileset(ORIGINAL_TILE_SET)
    end

    def new_tileset(hash)
      tile_set = []
      hash.each do |letter, num|
        num.times do
          tile_set << letter
        end
      end
      return tile_set
    end

    def draw_tiles(num)
      raise ArgumentError.new "input must be integer" if num.class != Integer

      drawn_tiles = []
      num.times do
        tile = ""
        tile = @tile_set.sample
        @tile_set.delete_at(@tile_set.find_index(tile))
        drawn_tiles << tile
      end
      return drawn_tiles
    end

    def tiles_remaining
      @tile_set.length
    end

  end
end
