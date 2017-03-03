require_relative 'scoring'
require_relative 'player'

module Scrabble
  class TileBag
    attr_reader :tile_bag , :tile , :players_tiles

    def initialize
      @tile_bag = %w( A A A A A A A A A
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
    end


    def draw_tiles(num)
      raise ArgumentError.new("Argument must be an Integer") if num.class != Integer

      tiles_selected = []

      num.times do |tile|
        selection = @tile_bag.sample
        tiles_selected << selection
        @tile_bag.delete_at(@tile_bag.index(selection) || @tile_bag.length)
      end
      return tiles_selected
    end

    def tiles_remaining
      @tile_bag.length
    end

  end
end
