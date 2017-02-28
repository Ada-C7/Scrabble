require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble::Scoring" do

  # test if letters have correct values attached
  it "Letters have correct values" do
    Scrabble::Scoring::LETTER_VALUES[:A].must_equal 1
    Scrabble::Scoring::LETTER_VALUES[:B].must_equal 3
    Scrabble::Scoring::LETTER_VALUES[:K].must_equal 5
    Scrabble::Scoring::LETTER_VALUES[:Z].must_equal 10
  end

  describe "self.score" do
    # check that word is no more than 7 letters long

    it "Raises error if input is not a String" do
        proc {
        Scrabble::Scoring.score(55)}.must_raise ArgumentError
    end

    it "Raises error if input has a non-letter" do
        proc {
        Scrabble::Scoring.score("cat7!")}.must_raise ArgumentError
    end

    it "Word is 7 letters or less" do
      proc {
        Scrabble::Scoring.score("supercalifragilistic")}.must_raise ArgumentError
      end

    # test that word is scored correctly and returns that score
    it "Scores word correctly" do
      Scrabble::Scoring.score("moo").must_equal 5
    end

    # also correct in case of: 7 letter word
    it "Scores 7-letter word correctly" do
      Scrabble::Scoring.score("hipster").must_equal 62
    end
  end

  describe "highest_score_from" do
    it "Raises error if argument is not an Array" do
        proc {
        Scrabble::Scoring.highest_score_from(55)}.must_raise ArgumentError
    end

    it "Raises error if argument contains a non-word" do
        proc {
        Scrabble::Scoring.highest_score_from(["cat7!", "dog"])}.must_raise ArgumentError
    end

    it "Scores all words correctly and returns highest scoring word" do
    Scrabble::Scoring.highest_score_from(["moo", "hipster", "hippo", "muzjiks"]).must_equal "muzjiks"
    end

    # test that highest score handles ties
    it "Handles ties correctly" do
      Scrabble::Scoring.highest_score_from(["cat", "bat", "l", "a"]).must_equal "cat"
    end

    # tests that it handles 7 letter tie correctly
    it "Handles 7 letter word ties correctly" do
      Scrabble::Scoring.highest_score_from(["cat", "goooooo", "zzzzzx"]).must_equal "goooooo"
    end
  end
end


# word and score are pushed to @wordarray
# it "adds new word & score element to words array" do
#   Scrabble::Scoring.score("moo")
# end
# it "adds multiple word & score elements to words array" do
# Scrabble::Scoring.score("moo")
# Scrabble::Scoring.score("hipster")
# end

# test that highest score method calculates correctly
# test that highest score is returned
