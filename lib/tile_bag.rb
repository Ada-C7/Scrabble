module Scrabble
  class TileBag
    attr_reader :tiles

    DEFAULT_SET = {A: 9, N: 6, B: 2,O: 8, C: 2, P: 2, D: 4,	Q: 1,
      E: 12,	R: 6, F: 2, S: 4, G: 3,	T: 6, H: 2,	U: 4, I: 9,	V: 2,
      J: 1,	W: 2, K: 1,	X: 1, L: 4,	Y: 2, M: 2,	Z: 1}

    def initialize
      @tiles = []
      DEFAULT_SET.each do |letter, number|
        number.times do
          @tiles.push(letter.to_s)
        end
      end
    end

    def draw_tiles(num)
      raise ArgumentError.new("argument must be positive") if num < 0
      raise ArgumentError.new("there isn't enough tiles to draw #{num}") if num > tiles_remaining
  
      tiles_drawn = []
      num.times do
        new_tile = @tiles.sample
        tiles_drawn.push(new_tile)
        @tiles.delete_at(@tiles.find_index(new_tile))
      end
      return tiles_drawn
    end

    def tiles_remaining
      @tiles.length
    end
  end
end
