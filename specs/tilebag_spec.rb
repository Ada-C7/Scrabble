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

               @my_tilebag.length.must_equal @my_tilebag.tiles
               @my_tilebag.length.must_equal 98

          end
     end

end
