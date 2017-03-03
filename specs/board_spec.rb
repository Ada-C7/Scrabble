require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/board'

#Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble::Board" do

  it "Creates a new instance of Board class" do
    game_board = Scrabble::Board.new
    game_board.must_be_instance_of Scrabble::Board
  end

  it "initializes with a board as an array" do
    game_board = Scrabble::Board.new
    game_board.board.must_be_instance_of Array
  end

  it "initializes with a board of 15 items in the board array" do
    game_board = Scrabble::Board.new
    game_board.board.length.must_equal 15
  end

  it "each initialization of a board creates arrays with 15 elements in each" do
    game_board = Scrabble::Board.new
    game_board.board.each do |row|
      row.length.must_equal 15
    end
  end

  it "check_playable method " do

  end

end
