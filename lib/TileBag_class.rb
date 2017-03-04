module Scrabble

# LETTER_POINT_VALUES = { 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
# 												2 => ["d", "g"],
# 												3 => ["b", "c", "m", "p"],
# 												4 => ["f", "h", "v", "w", "y"],
# 												5 => ["k"],
# 												8 => ["j", "x"],
# 												10 => ["q", "z"]}

  class TileBag
    # =>    attr_reader

    def initialize
      #set up the instance with a collection of all default tiles
      @default_set = ["A", "A", "A", "A", "A", "A", "A", "A", "A",
      "B", "B",
      "C", "C",
      "D", "D", "D", "D",
      "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
      "F", "F",
      "G", "G", "G",
      "H", "H",
      "I", "I", "I", "I", "I", "I", "I", "I", "I",
      "J",
      "K",
      "L", "L", "L", "L",
      "M", "M",
      "N", "N", "N", "N", "N", "N",
      "O", "O", "O", "O", "O", "O", "O", "O",
      "P", "P",
      "Q",
      "R", "R", "R", "R", "R", "R",
      "S", "S", "S", "S",
      "T", "T", "T", "T", "T", "T",
      "U", "U", "U", "U",
      "V", "V",
      "W", "W",
      "X",
      "Y","Y",
      "Z"]
      @draw_tiles = draw_tiles
      @tiles_remaining ||= @tiles
    end

    #fills tiles array until it has 7 letters from the given tile bag
    def draw_tiles(num)
    num.times do
    @tiles << default_set.pop!(rand(1..default_set.length))
    end

    def tiles_remaining#in tile bag
    return @default_set
    end

  end#class end
end#mod end
