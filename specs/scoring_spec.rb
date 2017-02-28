require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/score.rb'

describe "class Scoring" do
  # it "reads in DICTIONARY" do
  # end
  #
  # # it "reads in SCORES" do
  # #
  # # end


  describe "#calculate_letter" do
    it "gives an error if a non-letter is entered" do

      test_score = Scrabble::Scoring.new
      proc{

        test_score.calculate_letter(" ")
      }.must_raise ArgumentError
    end

    it "returns the correct point score" do
      test_score = Scrabble::Scoring.new
      test_score.calculate_letter("A").must_equal 1
    end

  end

  describe "self.score" do
    # it returns the score of the word if is_a_word is true
    # it returns 0 if the word does not exist
    # it adds 50 points if the word is 8 letters
    # it returns the right point value for word that is less than 8 letters

  end

  describe "break_ties" do
    # it takes 2 words as params
    # it compares the length of two words if word1 is bigger than word2, it returns word1 else, word2.
  end

  describe "self.highest_score_from" do
    # it tests if there is a single word, it will be returned as the best word.
    # it returns the shortest word as the best word if there is more than one best word
    # if returns the first word if there are more than one word with same length.
  end
end
