require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/board'
Minitest::Reporters.use!

describe "Board class" do

  describe "Board#initialize" do
    it "Creates new instance of Board class" do
        Scrabble::Board.new.class.must_equal Scrabble::Board
    end
    it "Instance must respond to @board" do
      Scrabble::Board.new.must_respond_to :board
    end
  end
  describe "Board#create_new_board" do
    it "Returns array" do
      Scrabble::Board.new.create_new_board.class.must_equal Array
    end
    it "Array length must be 15" do
      b = Scrabble::Board.new
      b.create_new_board.length.must_equal 15
    end
  end

  describe "Board#check_word_on_board" do
    it "Must raise error if column or row is not between 1 and 15" do
      proc{
        b = Scrabble::Board.new
        b.create_new_board
        b.check_word_on_board("apple",0,3,"up")
    }.must_raise ArgumentError
    end
    it "Must raise error if word or direction is not string" do
      proc{
        b = Scrabble::Board.new
        b.create_new_board
        b.check_word_on_board(3,5,3,true)
    }.must_raise ArgumentError
    end
    it "UP: Returns true if row - word.length > 0" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 5, 6, "up").must_equal true
    end
    it "DOWN: Returns true if row + word.length < 16" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 5, 6, "up").must_equal true
      b.check_word_on_board("apple", 10, 6, "up").must_equal true
    end
    it "DOWN: Returns false if row + word.length > 16" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 14, 6, "down").must_equal false
      b.check_word_on_board("apple", 11, 6, "down").must_equal true
    end
    it "RIGHT: Returns true if col + word.length < 16" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 14, 6, "right").must_equal true
      b.check_word_on_board("apple", 11, 10, "right").must_equal true
    end
    it "RIGHT: Returns false if col + word.length > 16" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 14, 14, "right").must_equal false
      b.check_word_on_board("apple", 11, 12, "right").must_equal false
    end
    it "LEFT: Returns true if col - word.length > 0" do
      b = Scrabble::Board.new
      b.create_new_board
      b.check_word_on_board("apple", 14, 8, "left").must_equal true
      b.check_word_on_board("apple", 11, 5, "left").must_equal true
    end
  end
end # end of class
