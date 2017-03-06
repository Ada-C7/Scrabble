# Create a Scrabble::TileBag class with a minimum of 5 specs.
# It should have the following class and instance methods:
#
# #initialize Should set up the instance with a collection of all default tiles
# #draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
# #tiles_remaining returns the number of tiles remaining in the bag
#
require_relative 'scrabble_scoring'

module Scrabble
  class TileBag
    attr_accessor :default_tiles

    def initialize
      @default_tiles = { A: 9, N: 6, B: 2, O: 8, C: 2, P: 2, D: 4, Q: 1, E: 12, R: 6, F: 2, S: 4, G: 3, T: 6, H: 2,
      U: 4, I: 9,	V: 2, J: 1,	W: 2, K: 1, X: 1, L: 4,	Y: 2, M: 2, Z: 1 }
    end

      def draw_tiles(num)
        tiles_drawn = []
          num.times do #this times loop isn't working. It's supposed to draw a random tile and subtract it from the bag however many times the user wants (num)
          random_key = @default_tiles.keys.to_a.sample
          #this loop to check doesn't work for some reason...
           while @default_tiles[random_key] > 0 do
          #   @default_tiles.delete(random_key) #this might count as a draw, which is a bug if that's the case
          # else
            @default_tiles[random_key] - 1
            tiles_drawn << random_key
            return tiles_drawn
          # else
          #   @default_tiles.delete(random_key)
          end
        end
      end
      # if the value becomes 0 then remove the key
      #     end
      #   return @default_tiles

      def tiles_remaining
        #need to sum all values
        @default_tiles.values.inject(:+)
      end


    end
  end
