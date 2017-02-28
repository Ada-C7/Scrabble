require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Baseline" do


  it "Has a hash" do
    Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
  end

  it "Iterates through the Hash key correctly" do
    Scrabble::Scoring.letter_value("A").must_equal 1
    Scrabble::Scoring.letter_value("D").must_equal 2
    Scrabble::Scoring.letter_value("K").must_equal 5
  end
end


describe "Wave 1" do

  it "Scores a word" do
    Scrabble::Scoring.score("cat").must_be_instance_of Integer
  end

  it "Scores a word correctly" do
    Scrabble::Scoring.score("cat").must_equal 5
  end

  it "letter value" do
    Scrabble::Scoring.letter_value("A").must_be_instance_of Integer
  end

  it "Scores a seven letter word correctly" do
    Scrabble::Scoring.score("aaaaaaa").must_equal 57
  end

  it "Finds the highest score in an array of words" do
    word = Scrabble::Scoring.highest_score_from_array(["Cat", "dog", "aaaaaaa"])
    word.must_equal "aaaaaaa"

  end

end
