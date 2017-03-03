require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'
require_relative '../lib/player'
require_relative '../lib/tilebag'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


describe Scrabble::TileBag do

     before do

     @my_tilebag = Scrabble::TileBag.new

     end

     describe "#initialize" do

          it "Is a kind of TileBag" do

                @my_tilebag.must_be_kind_of Scrabble::TileBag

          end

          it "Contains ## tiles in TileBag" do

               @my_tilebag.tile.length.must_equal 98

          end
     end

     describe "#draw_tiles(num) method" do

          it "Removes the designated number of tiles from the bag" do

               @my_tilebag.draw_tiles(7)
               @my_tilebag.drawn_tiles.length = 7
               @my_tilebag.tile.must_equal 91

          end

          it "Returns a collection of random tiles" do

               first_hand = @my_tilebag.draw_tiles(7)
               second_hand = @my_tilebag.draw_tiles(7)

               first_hand.wont_equal second_hand

          end
     end


end
