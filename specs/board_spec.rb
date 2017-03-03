require_relative 'spec_helper'
require_relative '../lib/board'

describe Scrabble::Board do

  before do
    @b = Scrabble::Board.new
    @right_turn = {word: 'TEST', column: 6, row: 6, direction: 'right'}
    @down_turn = {word: 'TOO', column: 6, row: 6, direction: 'down'}
  end

  describe "#initialize" do
    it "Creates a 15 x 15 blank board" do
      @b.board.flatten.length.must_equal 225
    end
  end

  describe "#display" do
    it "Must output the game board" do
      proc {
        @b.display
      }.must_output
    end
  end
  describe "#place_word" do
    it "Places a word vertically" do
      @b.place_word(@down_turn)
      @b.board[5][5].must_equal 'T'
      @b.board[6][5].must_equal 'O'
      @b.board[7][5].must_equal 'O'
    end

    it "Places a word horizontally" do
      @b.place_word(@right_turn)
      @b.board[5][5].must_equal 'T'
      @b.board[5][6].must_equal 'E'
      @b.board[5][7].must_equal 'S'
      @b.board[5][8].must_equal 'T'
    end

    it "Places a word connected to previously placed word" do
      @b.place_word(@right_turn)
      @b.place_word(word: 'too', column: 6, row: 6, direction: 'down')
      @b.board[5][5].must_equal 'T'
      @b.board[6][5].must_equal 'O'
      @b.board[7][5].must_equal 'O'
    end

    it "Raises an argument error if an invalid direction is given" do
      proc {
        @b.place_word(word: 'TEST', column: 6, row: 6, direction: 'left')
      }.must_raise ArgumentError
    end
  end

  describe "#tiles_needed" do
    it "Returns all letters in word if spaces are blank" do
      @b.tiles_needed(@right_turn).must_equal ['T', 'E', 'S', 'T']
    end

    it "Omits a letter if it is already on the board" do
      @b.place_word(@right_turn)
      @b.tiles_needed(@down_turn).must_equal ['O', 'O']
    end
  end

  describe "#space_available?" do
    it "Returns true if all spaces are empty" do
      @b.place_word(@right_turn)
      @b.space_available?(@down_turn).must_equal true
    end

    it "Returns false if one tile in the space is taken by an unrelated letter" do
      @b.place_word(@right_turn)
      @b.space_available?(
        word: 'SPOON', column: 6, row: 6, direction: 'down'
      ).must_equal false
    end

    it "Returns false if all spaces are taken" do
      @b.place_word(@right_turn)
      @b.space_available?(
        word: 'SPOON', column: 6, row: 6, direction: 'right'
      ).must_equal false
    end
  end
end
