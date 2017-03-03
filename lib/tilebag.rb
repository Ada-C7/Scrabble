require_relative 'score'
require_relative 'player'
require 'awesome_print'


module Scrabble

  class TileBag
    attr_reader :tile, :drawn_tiles

    def initialize
      @tile = %w(
      A A A A A A A A A
      B B
      C C
      D D D D
      E E E E E E E E E E E E
      F F
      G G G
      H H
      I I I I I I I I I
      J
      K
      L L L L
      M M
      N N N N N N
      O O O O O O O O
      P P
      Q
      R R R R R R
      S S S S
      T T T T T T
      U U U U
      V V
      W W
      X
      Y Y
      Z
      )
    end

    def draw_tiles(num)
      raise ArgumentError.new("You may draw only 1 - 7 tiles") if num > 7 || num <= 0
      # returns a collection of random tiles, removes the tiles from the default set
      @tile.shuffle!

      @drawn_tiles = []
      num.times { drawn_tiles << @tile.pop }
      @drawn_tiles
    end

  def tiles_remaining
    @tile.length
  end

  end
end
bag = Scrabble::TileBag.new
# puts bag.tile.length
puts bag.draw_tiles(-7)
puts bag.drawn_tiles.class
puts bag.tile.length
