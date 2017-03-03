require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag" do

  before do
    @bag = Scrabble::TileBag.new
  end

  describe "TileBag#initialize" do

    it "creates a TileBag class object" do
      @bag.must_be_instance_of Scrabble::TileBag
    end

    it "returns an array of tiles" do
      @bag.tile_bag.must_be_kind_of Array
      @bag.tile_bag.length.must_equal 98
      @bag.tile_bag.each do |letter|
        %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).must_include letter
      end
    end
  end

  describe "TileBag#draw_tiles" do

    it "Can be called by an instance of TileBag class" do
      @bag.must_respond_to :draw_tiles
    end

    it "Raises ArgumentError if no parameter given" do
      proc {
        @bag.draw_tiles
      }.must_raise ArgumentError
    end

    it "Raises ArgumentError if parameter is not an Integer" do
      proc {
        @bag.draw_tiles("five")
      }.must_raise ArgumentError
    end

    it "Returns an array" do
      @bag.draw_tiles(7).must_be_kind_of Array
    end

    it "Returns an array of the appropriate length" do
      @bag.draw_tiles(7).length.must_equal 7
    end

    it "Removes collection from default" do
      num = 7
      number_of_tiles = @bag.tile_bag.length
      @bag.draw_tiles(num)
      @bag.tile_bag.length.must_equal (number_of_tiles - num)
    end
  end

  describe "TileBag#tiles_remaining" do

    it "it can be called by a TileBag object" do
      @bag.must_respond_to :tiles_remaining
    end

    it "returns an integer" do
      @bag.tiles_remaining.must_be_kind_of Integer
    end

    it "returns the number of tiles in the tile bag" do
      number_of_tiles = @bag.tile_bag.length
      @bag.tiles_remaining.must_equal number_of_tiles
    end
  end
end
