require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_tilebag.rb'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag#initialize" do
  it "Creates a Scrabble::TileBag class" do
    tilebag = Scrabble::TileBag.new
    tilebag.must_be_kind_of Scrabble::TileBag
  end

  # it "Setting up a collection of all default tiles" do
  #   tilebag = Scrabble::TileBag.new
  #   tilebag.all_tiles.must_equal
  #
  # end
end
