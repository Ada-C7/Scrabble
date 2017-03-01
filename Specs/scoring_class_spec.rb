require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring_class'

describe "Score Method for Scoring Class" do

  before do
    @word = "camp"
    @word_7_letters = "quacked" #73
    @word_8_letters = "bushbuck" #71 #small African antelope
    @edge_word = "W@ter"
  end

  it "Raises argumentError if word contains anything other than letters" do
    skip
    proc { Scrabble::Scoring::score(@edge_word) }.must_raise ArgumentError
  end

  it "Handles if the word passed has a space (two words)" do
    skip
    Scrabble::Scoring::score(@edge_word)#unknown outcome
  end


  it "Score Method outputs integer" do
    puts Scrabble::Scoring::score(@word).must_be_instance_of Integer
  end

  it "Score method will total the value of each letter in the word" do

    Scrabble::Scoring::score(@word).must_equal 10
  end

  it "Adds a 50 point bonus to a 7 letter word" do
    skip
    Scrabble::Scoring::score(@word_7_letters).must_equal 73
  end

  it "adds 50 point bonus on words greater than 7 letters " do
    skip
    Scrabble::Scoring::score(@word_8_letters).must_equal 71
  end
end
