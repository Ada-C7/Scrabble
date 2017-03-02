require 'simplecov'
SimpleCov.start

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'
require_relative '../lib/scrabble'
require_relative '../lib/scrabble_tilebag'

describe "Scrabble::Tilebag" do

  before do
    @game_pile = Scrabble::Tilebag.new
  end

  describe "initiailize method" do

    it "return the instance of Tilebag" do
      @game_pile.must_be_instance_of Scrabble::Tilebag
    end

    it "initializes a instance variable of game tiles in an array" do
      @game_pile.bag.must_be_instance_of Array
    end

    it "starts with 98 elements in the collection" do
      @game_pile.bag.length.must_equal 98
    end
  end

  describe "#draw_tiles(num) method" do

    it "returns a collection of random tiles" do
      hand1 = @game_pile.draw_tiles(7)
      hand2 = @game_pile.draw_tiles(7)

      hand1.wont_be_same_as hand2
    end

    it "removes the tiles from the default set" do
      @game_pile.draw_tiles(1)
      @game_pile.bag.length.must_equal 97
    end
  end

  describe "tiles_remaining method" do
    it "draw tiles removes tiles from bag" do
      2.times do @game_pile.draw_tiles(1)

      @game_pile.tiles_remaining.must_equal 96
      end
    end
  end
end
