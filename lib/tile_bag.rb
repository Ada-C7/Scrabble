
require_relative 'scoring'
require_relative 'player'

module Scrabble

  attr_reader :tiles

  class TileBag

      tiles = %w( A A A A A A A A A
      B B C C D D D D
      E E E E E E E E E E E E
      F F G G G H H
      I I I I I I I I I
      J K L L L L M M
      N N N N N N
      O O O O O O O O
      P P Q R R R R R R
      S S S S T T T T T T
      U U U U V V
      W Y Y Z )

    def initialize

    end

    def draw_tiles
    players_tiles = ALL_TILES.sample(7)

    end

    def tiles_remaining(players_tiles)


    end

  end
end
