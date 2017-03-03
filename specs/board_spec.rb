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

  it "initializes with a board of 15 row arrays" do
    game_board = Scrabble::Board.new
    game_board.must_be_instance_of Scrabble::Board
  end
end
