require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scoring class" do
  it "Creates a new instance of Scoring class" do
    skip
    score = Scrabble::Scoring.new
    score.must_be_instance_of Scrabble::Scoring
  end

  describe "self.score method" do
    it "Compares word to score chart by each letter and adds up the score" do
      skip
      word = Scrabble::Scoring.score("ruby")
      word.must_equal 9
    end

    it "Adds 50 bonus points for a seven-letter word" do
      skip
      word = Scrabble::Scoring.score("kaitlin")
      word.must_equal 61
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "loop through and find highest scoring word" do
      words_array = Scrabble::Scoring.highest_score_from(["andrea", "kaitlin"])
      # words_array.must_equal 61
      words_array.must_equal "kaitlin"
       #seven letter word wins
      #test will also return winning word
    end

    it "in tie, fewest letters wins" do
      skip
      words_array = Scrabble::Scoring.highest_score_from(["aei", "ad"])
      #"ad" should be returned. How do we make a word from array return?
    end

    it "7 letter word wins in a tie" do
      skip
      words_array = Scrabble::Scoring.highest_score_from(["kdaaee", "kaitlin"])
      #should return seven-letter word b/c kdaaee = 11 and kaitlin = 11
    end

    it "7 letter word gets 50 point bonus" do

    end

    it "multiple words of same score and same length, first one is returned" do

    end

  end
end
