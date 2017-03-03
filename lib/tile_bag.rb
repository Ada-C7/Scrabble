require_relative 'scoring.rb'

module Scrabble
  class TileBag
    attr_accessor :tile_bag, :tile, :players_tiles

    def initialize
      tiles = {
        A:9 , B:2, C:2, D:4, E:12, F:2, G:3, H:2,
        I:9, J:1, K:1, L:4, M:2, N:6, O:8, P:2,
        Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1
      }

      @tile_bag = tiles.flat_map do |letter, quantity|
        [letter.to_s] * quantity
      end
    end

    def draw_tiles(num)
      raise ArgumentError.new("Argument must be an Integer") if num.class != Integer

      tiles_selected = []

      num.times do |tile|
        selection = @tile_bag.sample
        tiles_selected << selection
        @tile_bag.delete_at(@tile_bag.index(selection) || @tile_bag.length)
      end
      return tiles_selected
    end

    def tiles_remaining
      @tile_bag.length
    end
  end
end
