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
      @bag = Scrabble::TileBag.new
    end

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
end
