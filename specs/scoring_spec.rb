require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scoring class" do
  it "Creates a new instance of Scoring class" do
    score = Scrabble::Scoring.new
    score.must_be_instance_of Scrabble::Scoring
  end

  describe "self.score method" do
    it "Compares word to score chart by each letter and adds up the score" do
      word = Scrabble::Scoring.score("ruby")
      word.must_equal 9
    end
    #
    # it "Adds up the score" do
    #
    # end

    it "Adds 50 bonus points for a seven-letter word" do
      word = Scrabble::Scoring.score("kaitlin")
      word.must_equal 61
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "loop through and find highest scoring word" do

    end

    it "in tie, fewest letters wins" do

    end

    it "7 letter word wins in a tie" do

    end

    it "7 letter word gets 50 point bonus" do

    end

    it "multiple words of same score and same length, first one is returned" do

    end

  end
end
