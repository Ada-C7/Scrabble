require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use!

describe "Wave 1" do

  describe "Scoring#score" do

    it "Scrabble::Scoring.score returns total score" do
      word_score = Scrabble::Scoring.score("green")

      word_score.must_equal 6
    end

    it "seven letter word gets 50 points bonus" do
      word_score = Scrabble::Scoring.score("setting")

      word_score.must_equal 58
    end

    it "doesn't allow words > 7 letters" do
      proc { Scrabble::Scoring.score("discombobulated") }.must_raise ArgumentError
    end

    it "doesn't allow blank words" do
      proc { Scrabble::Scoring.score("") }.must_raise ArgumentError
    end

    it "forces words to be only made up of letters" do
      proc { Scrabble::Scoring.score("he11o")}.must_raise ArgumentError
      proc { Scrabble::Scoring.score("I'm a word") }.must_raise ArgumentError
    end
  end

  describe "Scoring#highest_score_from(word_array)" do
    it "returns highest scoring word from word array " do
      my_array = [ "blue", "gum", "bumble", "feet"]
      Scrabble::Scoring.highest_score_from(my_array).must_equal "BUMBLE"
    end

    it "if there's a tie, and one word used 7 letters, it wins" do
      my_array = ["love", "qzqzqx", "aaaaaag", "heyyy", "word"]
      Scrabble::Scoring.highest_score_from(my_array).must_equal "AAAAAAG"
    end

    it "if there's a tie, prefer word with fewer letters" do
      my_array = ["love", "qzqz", "kkkkxx", "heyyy", "word"]
      Scrabble::Scoring.highest_score_from(my_array).must_equal "QZQZ"

    end

  end



end
