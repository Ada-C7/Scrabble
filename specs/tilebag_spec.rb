require_relative 'spec_helper'

describe "Scrabble::Tilebag" do

  before do
    @game = Scrabble::Tilebag.new
  end

  describe "Scrabble::Tilebag#initialize" do

    it "Letters have correct quantities" do
      @game.letter_quantity.each do | letter, value |
        @game.letter_quantity[letter].must_equal value
      end
    end

    it "Bag is an array" do
      @game.bag.must_be_kind_of Array
      @game.bag.length.must_equal 98
    end

    it "Fill_bag fills @bag with correct number of letters" do
      @game.letter_quantity.each do | letter, value |
        @game.bag.count(letter).must_equal value
      end
    end

    it "Randomizes bag with each instance" do
      game2 = Scrabble::Tilebag.new
      game2.bag.must_be_kind_of Array
      @game.bag.wont_equal game2.bag
    end
  end

  describe "Scrabble::Tilebag#draw_tiles" do

    before do
      @draw = @game.draw_tiles(5)
    end

    it "Returns an array of letter symbols that's the same length as given argument" do
      @draw.must_be_kind_of Array
      @draw.length.must_equal 5
      @draw.each do | letter |
        letter.must_be_kind_of Symbol
        @game.letter_quantity.must_include letter
      end
    end

    it "will raise an error if the argument isn't an integer" do
      proc {
        @game.draw_tiles([:A, :B, :C])
      }.must_raise ArgumentError
    end

    it "will raise an error if there aren't enough tiles" do
      proc{
        @game.draw_tiles(98)
        @game.draw_tiles(5)
      }.must_raise ArgumentError
    end

  end


  describe "Scrabble::Tilebag#remaining_tiles" do

    it "Returns amount of remaining tiles" do
      @game.remaining_tiles.must_equal 98
    end

    it "Returns correct amount of remaining tiles after draw method has been called" do
      @game.draw_tiles(30)
      @game.remaining_tiles.must_equal 68
    end

  end

end
