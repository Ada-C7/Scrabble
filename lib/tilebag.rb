require_relative './player'

module Scrabble
  class TileBag < Player
  TILES = { A:9 , B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1, L:4, M:2, N:6, O:8, P:2, Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1 }
    def initialize
      @in_bag = []
      @tiles = []
      TILES.each do |key, value|
        value.times { @in_bag << key.to_s }
      end
    end

    def draw_tiles(num)
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
