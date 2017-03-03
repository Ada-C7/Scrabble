module Scrabble
  class TileBag
=begin DON'T know if we need this like this
  wrote it out just in case :P
  --- THIS IS NOT GOOD ---
  --- WE DON'T WANT A CONSTANT ---
  -- Oh... wait?---
    NUMBERS_OF_LETTERS = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
    }
=end

    def initialize
      #instance with collection of all default tiles
      #I see why it needs to be an instance because it's destructive

      #made this in Bank Account:
        #account_instance = Bank::Account.new(id, balance, open_date)
      #So our version:
        #tile_bag_instance = Scrabble::TileBag.new
    end

    def draw_tiles(num)
      #returns collection of random tiles
      #removes tiles from the default set
        #AH! So we don't want a CONSTANT variable because letter need to be REMOVED
        #Needs to be able pick a letter AND reduce the number
        #Picking random tiles AFFECTS the number of tiles for that letter

      #.rand only works for integers
      #USE THIS instead
        #('a'..'z').to_a.sample

    end

    def tiles_remaining
      #returns the number of tiles remaining in the bag
      #maybe looks at .draw_tiles(num) and removes
      #may NOT work calling directly on method since it's picking at random
      #need to call on this specific instance
    end


  end
end
