module Scrabble
  class TileBag
    attr_reader :all_tiles
    attr_accessor :picked_tiles
    def initialize
      @all_tiles = {
        "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12,
        "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1,
        "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8,
        "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6,
        "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
      }
      @picked_tiles = []
    end

    def draw_tiles(num)
      num.times do
        picked_tile = @all_tiles.keys.sample
        @picked_tiles << picked_tile
        @all_tiles[picked_tile] -= 1
        if @all_tiles[picked_tile] == 0
          @all_tiles.delete(picked_tile)
        end
      end
      return @picked_tiles

    end



  end
end


# tilebag = Scrabble::TileBag.new
# tilebag.draw_tiles(5)
# print tilebag.picked_tiles
# print tilebag.all_tiles
# print tilebag.all_tiles.values.inject(:+)


# a = {"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12}
# b = a.keys.sample
# c = a[b] -= 1 #returns the number of letter b - 1
# puts a.values.inject(:+)
