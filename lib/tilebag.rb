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
    def self.new_tileset
      tile_set = []
      ORIGINAL_TILE_SET.each do |letter, num|
        num.times do
          tile_set << letter
        end
      end
      return tile_set
    end

    def initialize
      @tile_set = Scrabble::TileBag.new_tileset

    end

    def draw_tiles(num)
      #
    end

    def tiles_remaining
      #returns the number of tiles remaining in bag
    end

  end
end

tile_bag =  Scrabble::TileBag.new
puts tile_bag.tile_set
