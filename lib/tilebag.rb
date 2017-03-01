require_relative './player'

module Scrabble
  class TileBag < Player
  TILES = { A:9 , B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1, L:4 }
    def initialize
      @in_bag = []
      @tiles = []
      TILES.each do |key, value|
        value.times { @in_bag << key.to_s }
      end

    end

    def draw_tiles(num) # 1 - 7
      num.times { @tiles << @in_bag.shuffle!.pop }
      @tiles
    end

    def tiles_remaining
      @in_bag.length
    end
  end
end

test_one = Scrabble::TileBag.new
puts test_one.tiles_remaining
test_one.draw_tiles(2)
puts test_one.tiles_remaining
test_one.draw_tiles(6)
puts test_one.tiles_remaining
test_one.draw_tiles(3)
puts test_one.tiles_remaining

# `#tiles` a collection of letters that the player can play (max 7)
# [array of letters]
# `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag




# - `#initialize` Should set up the instance with a collection of all default tiles
# - `#draw_tiles(num)` returns a collection of random tiles, removes the tiles from the default set
# - `#tiles_remaining` returns the number of tiles remaining in the bag
