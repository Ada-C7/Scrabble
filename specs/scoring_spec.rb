require_relative 'spec_helper'

describe "Scrabble::Scoring" do

  it "Letters have correct values" do
    Scrabble::Scoring::LETTER_VALUES[:A].must_equal 1
    Scrabble::Scoring::LETTER_VALUES[:B].must_equal 3
    Scrabble::Scoring::LETTER_VALUES[:K].must_equal 5
    Scrabble::Scoring::LETTER_VALUES[:Z].must_equal 10
  end

  describe "self.score" do

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

    it "Scores all words correctly and returns highest scoring word" do
    Scrabble::Scoring.highest_score_from(["moo", "hipster", "hippo", "muzjiks"]).must_equal "muzjiks"
    end

    # test that highest score handles ties
    it "Handles tied scores with tied word lengths correctly" do
      Scrabble::Scoring.highest_score_from(["cat", "bat", "l", "a"]).must_equal "cat"
    end

    it "handles tied scores correctly" do
      Scrabble::Scoring.highest_score_from(["cat", "bat", "l", "a"]).must_equal "cat"
    end

    # tests that it handles 7 letter tie correctly
    it "Handles 7 letter word ties correctly" do
      Scrabble::Scoring.highest_score_from(["cat", "goooooo", "zzzzzx"]).must_equal "goooooo"
      # attempt to get 100% coverage for scoring_spec, failed for now
      # Scrabble::Scoring.highest_score_from(["cat", "zzzzzx", "goooooo", "job"]).must_equal "goooooo"
    end
  end
end
