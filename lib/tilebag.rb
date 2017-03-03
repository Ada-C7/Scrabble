
require_relative './player'

module Scrabble
    class TileBag < Player
        TILES = { 1 => %w(J K Q X Z),
                  2 => %w(B C F H M P V W Y),
                  3 => %w(G),
                  4 => %w(D L U S),
                  6 => %w(N R T),
                  8 => %w(O),
                  9 => %w(A I),
                  12 => %w(E) }.freeze
        def initialize
            @in_bag = TILES.to_a.reject { |array| array.each { |things| things[0] } }
            print TILES.to_a
            print @in_bag
            # TILES.each do |key, value|
            #   value.times { @in_bag << key.to_s }
            # end
        end

        def draw_tiles(num) # 1 - 7
            num.times { @tiles << @in_bag.shuffle!.pop }
            @tiles
        end

        def tiles_remaining
            @in_bag.length
        end
    end
end

test_one = Scrabble::TileBag.new
puts test_one.tiles_remaining
print test_one.draw_tiles(2)
test_one.draw_tiles(7)
# test_one.draw_tiles(6)
puts test_one.tiles_remaining
# test_one.draw_tiles(3)
# puts test_one.tiles_remaining
