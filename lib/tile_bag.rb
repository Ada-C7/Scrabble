

module Scrabble
  class TileBag
    attr_reader :tiles_remaining

    def initialize
      @tiles_remaining = %W( A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z )
    end

    def draw_tiles(num)
      tiles_drawn = []
      @tiles_remaining.shuffle
      num.times { tiles_drawn << @tiles_remaining.pop }

      return tiles_drawn
    end

  end
end
