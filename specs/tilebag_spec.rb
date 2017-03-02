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

    end

    it "contains right amount of elements-length" do


    end

    it "contains the right amount of each letter" do

    end

    it "creates tiles_remaining with proper existing amount of tiles" do
      tilebag = Scrabble::Tilebag.new
      tilebag.get_remaining_tiles.must_equal 9
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
      tilebag.get_remaining_tiles.must_equal size -7
    end

  end
end
