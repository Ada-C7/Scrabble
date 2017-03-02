module Scrabble

  class Tilebag
    attr_accessor :player_bag, :bag

    def initialize
      @bag = %w[
        a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i
        i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r
        s s s s t t t t t t u u u u v v w w x y y z
      ]
      @player_bag = []
    end

    def draw_tiles(num)
      num.times do
        tile = @bag.sample
        @player_bag << tile
        @bag.slice!(@bag.index(tile))
        #previous method deleted all matching, this deletes first occurance
      end


    end

    def tiles_remaining
      return @bag.length
    end

  end

end
