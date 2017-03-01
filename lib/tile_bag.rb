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
    end

  end#end of TileBag class
end#end of Scrabble module
