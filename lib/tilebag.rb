module Scrabble
  class TileBag

    def initialize
      @collection = %w(e)*12 + %w(a i)*9 + %w(o)*8 + %w(n r t)*6 + %w(d l s u)*4 + %w(g)*3 + %w(b c f h m p v w y)*2 + %w(j k q x z)
    end

    def self.draw_tiles(num)
      return @collection.rand(0..num)
    end

    def self.tiles_remaining

    end

  end
end
#initialize Should set up the instance with a collection of all default tiles
#draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
#tiles_remaining returns the number of tiles remaining in the bag

print Scrabble::TileBag.draw_tiles(20)
