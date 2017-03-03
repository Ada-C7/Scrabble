module Scrabble
  class TileBag
    attr_reader :bag_of_letters
    def initialize
      @bag_of_letters = {A:9, B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1,
        L:4, M:2, N:6, O:8, P:2, Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1}
    end

    def draw_tiles(num_of_tiles)
      raise ArgumentError.new("Argument must be an Integer") if num_of_tiles.class != Integer
      raise ArgumentError.new("Sorry, only #{tiles_remaining} tiles left in the bag") if num_of_tiles > tiles_remaining
      tiles_drawn = []
      num_of_tiles.times do |number|
        draw = @bag_of_letters.keys.sample
        tiles_drawn << draw.to_s
        @bag_of_letters[draw] -= 1
        @bag_of_letters.delete_if{ |k, v| v == 0 }
      end
      return tiles_drawn
    end

    def tiles_remaining
      @bag_of_letters.values.sum
    end
  end # end of class TileBag
end #end of module Scrabble
