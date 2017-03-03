module Scrabble
  class TileBag
    attr_reader :collection

    #initialize Should set up the instance with a collection of all default tiles
    def initialize
      @collection = %w(e)*12 + %w(a i)*9 + %w(o)*8 + %w(n r t)*6 + %w(d l s u)*4 + %w(g)*3 + %w(b c f h m p v w y)*2 + %w(j k q x z)
    end

    #draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
    def draw_tiles(num)
      raise ArgumentError.new "Specify only numbers" if num.class != Integer
      player_hand = []

      num.times do |letter|
        player_hand << @collection.shuffle!.pop
      end

      return player_hand
    end

    #tiles_remaining returns the number of tiles remaining in the bag
    def tiles_remaining
      return @collection.length
    end

  end
end
