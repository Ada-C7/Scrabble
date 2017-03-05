require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scoring class" do
  it "Creates a new instance of Scoring class" do
    # skip
    score = Scrabble::Scoring.new
    score.must_be_instance_of Scrabble::Scoring
  end

  describe "self.score method" do
    it "Compares word to score chart by each letter and adds up the score" do
      # skip
      word = Scrabble::Scoring.score("ruby")
      word.must_equal 9
    end

    it "Adds 50 bonus points for a seven-letter word" do
      # skip
      word = Scrabble::Scoring.score("kaitlin")
      word.must_equal 61
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "loop through and find highest scoring word" do
      # skip
      words_array = Scrabble::Scoring.highest_score_from(["andrea", "kaitlin"])
      words_array.must_equal "kaitlin"
    end

    it "in tie, fewest letters wins" do
      # skip
      words_array = Scrabble::Scoring.highest_score_from(["aei", "ad"])
      words_array.must_equal "ad"
    end

    it "7 letter word wins in a tie" do
      # skip
      words_array = Scrabble::Scoring.highest_score_from(["qzqzqj", "aeiould"])
      words_array.must_equal "aeiould"
      #should return aeiould (58 points) over qzqzqj (58 points), b/c aeiould is seven letters and wins
    end

    it "In case of tie, min_by returns winning word by minimum word length rather than minimum lexicographical order value" do
      words_array = Scrabble::Scoring.highest_score_from(["aei", "ag"])
      words_array.must_equal "ag"
    end

    it "multiple words of same score and same length, first one is returned" do
      # skip
      words_array = Scrabble::Scoring.highest_score_from(["aei", "oul"])
      words_array.must_equal "aei"
    end
  end
end
