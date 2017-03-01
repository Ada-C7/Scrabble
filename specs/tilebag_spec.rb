require_relative 'spec_helper'

describe "Scrabble::Tilebag" do

  describe "Scrabble::Tilebag#initialize" do

    it "Letters have correct quantities" do
      Scrabble::Tilebag.new.letter_quantity[:A].must_equal 9
      Scrabble::Tilebag.new.letter_quantity[:D].must_equal 4
      Scrabble::Tilebag.new.letter_quantity[:N].must_equal 6
      Scrabble::Tilebag.new.letter_quantity[:Z].must_equal 1
    end

  end

  describe "Scrabble::Tilebag#draw_tiles and #draw_letter" do

    before do
      @game = Scrabble::Tilebag.new
    end

    it "Returns an array that's the same length as given argument" do
      @game.draw_tiles(5).must_be_kind_of Array
      @game.draw_tiles(5).length.must_equal 5
    end

    it ""

  end

end
