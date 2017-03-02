require_relative 'scoring'
require_relative 'player'

module Scrabble
  class TileBag
    attr_reader :player_hand

    def initialize
      @bag = bag
     @player_hand = []
    end

    def bag
      array = []
      9.times { array << "A"}
      2.times { array << "B"}
      2.times { array << "C"}
      4.times { array << "D"}
      12.times { array << "E"}
      2.times { array << "F"}
      3.times { array << "G"}
      2.times { array << "H"}
      9.times { array << "I"}
      1.times { array << "J"}
      1.times { array << "K"}
      4.times { array << "L"}
      2.times { array << "M"}
      6.times { array << "N"}
      8.times { array << "O"}
      2.times { array << "P"}
      1.times { array << "Q"}
      6.times { array << "R"}
      4.times { array << "S"}
      6.times { array << "T"}
      4.times { array << "U"}
      2.times { array << "V"}
      2.times { array << "W"}
      1.times { array << "X"}
      2.times { array << "Y"}
      1.times { array << "Z"}
      return array
    end

    def draw_tiles(num)
      num.times do
        tile = ""
        tile = @bag.sample
        player_hand << tile
        @bag.each_with_index do |letter, index|
          if letter == tile
            @bag.delete_at(index)
            break
          end
        end
      end
      return @player_hand
    end

    def tiles_remaining
      return @bag.length
    end


  end
end

# game = Scrabble::TileBag.new
# print game.draw_tiles(3)
# print game.tiles_remaining
# print game.player_hand
