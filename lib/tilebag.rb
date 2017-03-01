module Scrabble
  class TileBag

    def initialize
      @default_tiles = {
        "A"=>9, "B"=>2, "C"=>2, "D"=>4,
        "E"=>12, "F"=>2, "G"=>3, "H"=>2,
        "I"=>9, "J"=>1, "K"=>1, "L"=>4,
        "M"=>2, "N"=>6, "O"=>8, "P"=>2,
        "Q"=>1, "R"=>6, "S"=>4, "T"=>6,
        "U"=>4, "V"=>2, "W"=>2, "X"=>1,
        "Y"=>2, "Z"=>1
      }
      @available_letters = ("A".."Z").to_a
    end

    def draw_tiles(num)
      tiles = []

      num.times do
        letter = @available_letters.sample
        tiles << letter
        @default_tiles[letter] -= 1
        @available_letters.delete(letter) if @default_tiles[letter] == 0
      end
      return tiles
    end

    def tiles_remaining
      @default_tiles.values.reduce(:+)
    end
  end
end
