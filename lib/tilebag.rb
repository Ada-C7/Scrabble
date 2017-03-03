# require_relative './player'

module Scrabble
  class TileBag
  attr_accessor :tiles_drawn, :in_bag
  TILES = {
    1 => %w(J K Q W Z),
    2 => %w(B C F H M P V W Y),
    3 => %w(G),
    4 => %w(D L S U),
    6 => %w(N R T),
    8 => %w(O),
    9 => %w(A I),
    12 => %w(E)
  }.freeze

    def initialize
      @in_bag = [] # tiles in bag
      TILES.each {|key, values| key.times {values.each {|letter| @in_bag << letter }}}# create all tiles and put in bag
      @in_bag.shuffle!
      @tiles_drawn = []
    end

    def draw_tiles(number)
      raise ArgumentError "not enough tiles" if tiles_remaining < number
      @tiles_drawn = @in_bag.pop(number)
      print @tiles_drawn # <-- TEST PURPOSES ONLY
    end

    def tiles_remaining
      @in_bag.length
    end
  end
end

# <-- TEST PURPOSES ONLY
test_one = Scrabble::TileBag.new
puts "remaining tiles: #{test_one.tiles_remaining}"
test_one.draw_tiles(70)
puts "remaining tiles: #{test_one.tiles_remaining}"
test_one.draw_tiles(20)
puts "remaining tiles: #{test_one.tiles_remaining}"
test_one.draw_tiles(10)
puts "remaining tiles: #{test_one.tiles_remaining}"
