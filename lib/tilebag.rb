module Scrabble

  class Tilebag
    attr_reader :letter_quantity, :bag

    def initialize
      @letter_quantity = {
        A: 9, B: 2, C: 2, D: 4,
        E: 12, F: 2, G: 3, H: 2,
        I: 9, J: 1, K: 1, L: 4,
        M: 2, N: 6, O: 8, P: 2,
        Q: 1, R: 6, S: 4, T: 6,
        U: 4, V: 2, W: 2, X: 1,
        Y: 2, Z: 1 }
      @bag ||= fill_bag
    end

    def fill_bag
      bag = []
      @letter_quantity.map do |key, value|
        value.times do
          bag << key
        end
      end

      bag.shuffle!
    end

    def draw_tiles(num)
      raise ArgumentError.new("There aren't that many tiles left!") if num > @bag.length
      user_bag = []
      num.times { user_bag << @bag.pop }

      return user_bag
    end

    def remaining_tiles
      @bag.length
    end

  end
end
