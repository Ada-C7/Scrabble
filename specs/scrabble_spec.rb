require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Baseline" do


  it "Has a hash" do
    Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
  end

  # it "Iterates through the Hash key correctly" do
  #   Scrabble::Scoring.letter_value("A").must_equal 1
  #   Scrabble::Scoring.letter_value("D").must_equal 2
  #   Scrabble::Scoring.letter_value("K").must_equal 5
  # end
end


describe "Wave 1" do

  it "Scores a word" do
    Scrabble::Scoring.score("CAT").must_be_instance_of Integer
  end

  it "Scores a word correctly" do
    Scrabble::Scoring.score("CAT").must_equal 5
  end

  it "Scores a seven letter word correctly" do
    Scrabble::Scoring.score("aaaaaaa").must_equal 57
  end
  #
  it "Finds the highest score in an array of words" do
    word = Scrabble::Scoring.highest_score_from_array(["Cat", "dog", "aaaaaaa"])
    word.must_equal "AAAAAAA"
  end
  #
  it "Breaks a tie" do
    word = Scrabble::Scoring.highest_score_from_array(["aaaa", "dg"])
    word.must_equal "DG"
  end

  it "Breaks a tie correctly when one word is 7" do
    word = Scrabble::Scoring.highest_score_from_array(["FUUUUUU", "ZZZZZZ"])
    word.must_equal "FUUUUUU"
  end
  #
  it "Returns first word in list if several words are same length and same score" do
    word = Scrabble::Scoring.highest_score_from_array(["cat", "ZZZZ", "QQQQ"])
    word.must_equal "ZZZZ"
  end

end
