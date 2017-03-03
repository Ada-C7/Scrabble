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
      @default_tiles = { A: 9, N: 6, B: 2, O: 8, C: 2, P: 2, D: 4, Q: 1, E: 12,
        R: 6, F: 2, S: 4, G: 3, T: 6, H: 2, U: 4, I: 9,	V: 2, J: 1,	W: 2, K: 1,
        X: 1, L: 4,	Y: 2, M: 2, Z: 1 }
    end

    def draw_tiles(num)
      @default_tiles.rand(num)

      #@default_tiles.each do |letter, amount|
        #I need to figure out how to match the letter to the correct letter
        #then I subtract num

    end




  end
end

a = Scrabble::TileBag.new
print a.default_tiles
