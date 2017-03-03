require_relative 'spec_helper'
require_relative '../lib/tilebag'

describe TileBag do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  describe "initialize" do


    it "creates an array of all 98 tiles" do
      @tile_bag.collection.length.must_equal 98
      @tile_bag.collection.must_be_instance_of Array
    end

    it "has the right number of each letter" do
      letter_a = @tile_bag.collection.select { |letter| letter == "a"}
      letter_a.length.must_equal 9

      letters = @tile_bag.collection.group_by { |letter| letter[0] }
      letter_hash = letters.each do |k, v| letters[k] = v.length


      end

    end
  end
    describe "draw_tiles" do


      it "takes an Integer" do
        proc { @tile_bag.draw_tiles("cat")}.must_raise ArgumentError
      end

      it "returns an Array of same length as number of tiles drawn" do
        @tile_bag.draw_tiles(4).must_be_instance_of Array
        @tile_bag.draw_tiles(4).length.must_equal 4
      end

      it "returns an Array of one-character length strings" do
        draw = @tile_bag.draw_tiles(3)
        draw.
      end

    end

    describe "tiles_remaining" do

    end

  end
