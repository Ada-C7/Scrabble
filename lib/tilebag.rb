
module Scrabble
    class TileBag
        attr_accessor :tiles_drawn, :in_bag

        TILES = {
            A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9,
            J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6,
            S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1
        }.freeze

        def initialize
            @in_bag = [] # tiles in bag
            TILES.each do |key, values| # create all tiles and put in bag
                values.times { @in_bag << key.to_s }
            end
            @in_bag.shuffle!
            @tiles_drawn = []
        end

        def draw_tiles(number)
            raise ArgumentError, 'not enough tiles' if @in_bag.length < number
            @tiles_drawn = @in_bag.pop(number)
            @tiles_drawn
        end

        def tiles_remaining
            if @in_bag.empty?
                puts 'There are no more tiles!'
            else
                @in_bag.length
          end
        end
  end
end

# # <-- TEST PURPOSES ONLY
test_one = Scrabble::TileBag.new
test_two = Scrabble::TileBag.new

test_one.draw_tiles(3)
this = test_one.in_bag.find_all { |letter| test_one.tiles_drawn.include? letter }
print this
# puts "remaining tiles: #{test_one.tiles_remaining}"
# test_one.draw_tiles(99)
# puts "remaining tiles: #{test_one.tiles_remaining}"
# test_one.draw_tiles(20)
# puts "remaining tiles: #{test_one.tiles_remaining}"
# test_one.draw_tiles(10)
# puts "remaining tiles: #{test_one.tiles_remaining}"
