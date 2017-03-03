module Scrabble

  class TileBag
    DEFAULT_TILES = {
      "a" => 9,
      "b" => 2,
      "c" => 2,
      "d" => 4,
      "e" => 12,
      "f" => 2,
      "g" => 3,
      "h" => 2,
      "i" => 9,
      "j" => 1,
      "k" => 1,
      "l" => 4,
      "m" => 2,
      "n" => 6,
      "o" => 8,
      "p" => 2,
      "q" => 1,
      "r" => 6,
      "s" => 4,
      "t" => 6,
      "u" => 4,
      "v" => 2,
      "w" => 2,
      "x" => 1,
      "y" => 2,
      "z" => 1,
    }

    attr_reader :tile_bag

    def initialize
      @tile_bag = []
      DEFAULT_TILES.each do |letter, amount|
        amount.times do
          @tile_bag << letter
        end
      end
    end

    def draw_tiles(num)
      raise ArgumentError.new("Number of tiles must be 0 or positive") if ( (num < 0) || (num.class != Integer) )
      @tile_bag.shuffle!.pop(num)
    end

  end
end



new_bag = Scrabble::TileBag.new
