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
      player_bag = []
      num.times do
        tile = @bag.sample # we can't use pop because it doesn't give us a random set
         @player_bag << tile
        player_bag << tile # player bag is used in the Player class where we don't need to track the same player bag, it's just a new one over and over
        @bag.slice!(@bag.index(tile)) # we use slice vs delete because it will only delete one instance of the letter rather than all instances of that letter
        #previous method deleted all matching, this deletes first occurance
      end

      return player_bag

    end

    def tiles_remaining
      return @bag.length
    end

  end

end
