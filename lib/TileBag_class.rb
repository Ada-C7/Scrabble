module Scrabble
  #
  class TileBag
    # =>    attr_reader

    def initialize
      #set up the instance with a collection of all default tiles
      @default_set = [ [A, 9], [B, 2], [C, 2], [D, 4], [E, 12],
      [F, 2], [G, 3], [H, 2], [I, 9], [J, 1], [K, 1], [L, 4],
      [M, 2], [N, 6], [O, 8], [P, 2], [Q, 1], [R, 6], [S, 4],
      [T, 6], [U, 4], [V, 2], [W, 2], [X, 1], [Y, 2], [Z, 1] ]
      #interate through 0-25 for alpha 1-26
      @draw_tiles = draw_tiles
      @tiles_remaining ||=
    end

    def draw_tiles(num)
      #return a collection of random tiles, removes the tiles from the default set
    end

    def tiles_remaining
      #return the number of tiles remaining in the bag
    end

  end#class end
end#mod end
