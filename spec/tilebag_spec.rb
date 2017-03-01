require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag" do

  describe "TileBag#initialize" do
    before do
      @tile_bag = Scrabble::TileBag.new
    end

    it "creates a TileBag class object" do

      @tile_bag.must_be_instance_of Scrabble::TileBag
    end

    it "returns an array of tiles" do
      @tile_bag.must_be_kind_of Array
      @tile_bag.length.must_equal 98
      %w(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V).must_include @tile_bag
    end
  end
end
