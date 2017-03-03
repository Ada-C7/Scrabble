module Scrabble

  class Tilebag
    attr_reader :letter_quantity

    def initialize
      @letter_quantity = {
        A: 9, B: 2, C: 2, D: 4,
        E: 12, F: 2, G: 3, H: 2,
        I: 9, J: 1, K: 1, L: 4,
        M: 2, N: 6, O: 8, P: 2,
        Q: 1, R: 6, S: 4, T: 6,
        U: 4, V: 2, W: 2, X: 1,
        Y: 2,Z: 1 }
    end

    # returns a collection of random tiles, removes the tiles from the default set
    def draw_tiles(num)
      user_bag = []

      num.times do
        user_bag << draw_letter
      end

      return user_bag

    end

    def draw_letter
      selected_letter = @letter_quantity.keys.sample

      if @letter_quantity[selected_letter] != 0
        @letter_quantity[selected_letter] -= 1
        return selected_letter
      else
        draw_letter
      end
    end


    # returns the number of tiles remaining in the bag
    # def tiles_remaning
    #   @letter_quantity.values.inject { | total, value | total + value }
    # end

  end
end

# hash.key(value)
# h = Scrabble::Tilebag.new
#
#
#
# all_letters = []
#
# 98.times do
#   all_letters << h.draw_letter
# end
#
# group = all_letters.sort.group_by {| letter | letter }
# puts group.map { |letter, count | count.length }



# puts h.draw_tiles(5)
# 98.times do
# puts h.draw_letter
# end
# puts h.letter_quantity.values.inject{ | total, value | total + value }
# puts h.letter_quantity
