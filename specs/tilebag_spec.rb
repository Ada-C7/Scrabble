require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/score'
require_relative '../lib/player'
require_relative '../lib/tilebag'

describe "tilebag" do
  describe "initialize" do
    it "creates an array of letters for the players " do
      tilebag = Scrabble::Tilebag.new
      tilebag.tilebag.must_be_kind_of Array
    end

    it "contains every letter of the alphabet " do
      tilebag = Scrabble::Tilebag.new
      tilebag.tilebag.uniq.length.must_equal 26
    end


    it "contains the right amount of each letter" do
      tilebag = Scrabble::Tilebag.new
      expected = {"A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12, "F"=>2, "G"=>3, "H"=>2, "I"=>9, "J"=>1,  "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1, "R"=>6, "S"=>4, "T"=>6, "U"=>4, "V"=>2, "W"=>2, "X"=>1, "Y"=>2, "Z"=>1}.sort

      hash = Hash[tilebag.tilebag.group_by(&:itself).map {|letter,value| [letter, value.length]}].sort

      hash.must_equal expected
    end

    it "creates tiles_remaining with proper existing amount of tiles" do
      tilebag = Scrabble::Tilebag.new
      tilebag.get_remaining_tiles.must_equal 98
    end
  end

  describe "#draw_tiles(num)" do
    it "give an array from tilebag" do
      tilebag = Scrabble::Tilebag.new
      tilebag.draw_tiles(7).must_be_kind_of Array
    end

    it "returns an array with a right amount of elements" do
      tilebag = Scrabble::Tilebag.new
      tilebag.draw_tiles(7).length.must_equal 7
    end

    it "removes tiles from default set(tilebag)" do
      tilebag = Scrabble::Tilebag.new
      size = tilebag.get_remaining_tiles
      tilebag.draw_tiles(7)
      tilebag.get_remaining_tiles.must_equal size - 7
    end

  end
end
