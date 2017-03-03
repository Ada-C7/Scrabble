module Scrabble
  class TileBag
    attr_reader :tile_bag

    def initialize
      @tile_bag = Scrabble::TileBag.create_tile_bag
    end

    def self.create_tile_bag
      letters = ("a".."z").to_a
      quantity= [9,2,2,4,12,2,3,2,9,1,1,4,2,6,8,2,1,6,4,6,4,2,2,1,2,1]
      tile_bag = []

      26.times do |i|
        quantity[i].times do
          tile_bag<< letters[i]
        end
      end
      tile_bag
    end#end of create_tile_bag method

    def draw_tiles(num)
      if num.class != Integer
        raise ArgumentError.new("Parameter must be integer")
      end

      drawn_tiles = []
      num.times do
        rand_num = rand(0...@tile_bag.length)
        drawn_tiles << @tile_bag[rand_num]
        @tile_bag.delete_at(rand_num)
      end
      drawn_tiles
    end

    def tiles_remaining
      @tile_bag.length
    end
  end#end of TileBag class
end#end of Scrabble module
