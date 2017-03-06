require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_tilebag'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble TileBag" do

  it "has a collection of tiles" do
    a = Scrabble::TileBag
    a.@default_tiles.must_be_kind_of Hash
  end

  it "returns an array of tiles drawn" do
    a = Scrabble::TileBag
    a.draw_tiles(3).must_be_kind_of Array
  end

  it "subtracts one random tile from each draw" do
    a = Scrabble::TileBag
    a.draw_tiles(1)
    @default_tiles[A:] -1.must_equal 8
  end

  it "selects a random tile" do
    a = Scrabble::TileBag
    a.draw_tiles(2)
    random_key.must_equal @default_tiles.keys.to_a.sample
  end

  it "sums the times remaining" do
    a = Scrabble::TileBag
    a.tiles_remaining.must_equal 98
  end


end
