

module Scrabble
  class TileBag
    attr_reader :tiles_in_bag

    def initialize
      @tiles_in_bag = %W( A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z )
    end

    def draw_tiles(num)
      raise ArgumentError.new("Number of tiles to draw must be an integer") if num.class != Integer

      raise ArgumentError.new("You must draw at least one tile!") if num <= 0

      raise ArgumentError.new("You cannot draw more than are available!") if num > @tiles_in_bag.length

      tiles_drawn = []
      @tiles_in_bag.shuffle!
      num.times { tiles_drawn << @tiles_in_bag.pop }

      return tiles_drawn
    end

    def tiles_remaining
      return @tiles_in_bag.length
    end
  end
end
