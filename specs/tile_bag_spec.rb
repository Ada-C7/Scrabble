require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'
Minitest::Reporters.use!

describe "Scrabble#TileBag" do
  describe "TileBag#create_tile_bag" do
    it "returns an array" do
      Scrabble::TileBag.create_tile_bag.class.must_equal Array
    end
    it "returns an array full of single letter string" do
      tile_bag = Scrabble::TileBag.create_tile_bag
      tile_bag.each do |letter|
        letter.length.must_equal 1
        letter.class.must_equal String
      end
    end

  end

  describe "TileBag#initialize" do
    it "Creates new instance of TileBag class" do
      Scrabble::TileBag.new.class.must_equal Scrabble::TileBag
    end
    it "instance must respond to tile_bag" do
      Scrabble::TileBag.new.must_respond_to :tile_bag
    end
    it "initializes with an array" do
      tile_bag1 = Scrabble::TileBag.new
      tile_bag1.tile_bag.class.must_equal Array
    end





  end

end
