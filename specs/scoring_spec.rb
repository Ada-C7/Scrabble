require_relative 'spec_helper'
require_relative '../lib/scoring'

Minitest::Reporters.use!

describe "Scoring tests" do

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

    it "allows both uppercase/lowercase words" do
      word_score1 = Scrabble::Scoring.score("SETTING")
      word_score2 = Scrabble::Scoring.score("setting")

      word_score1.must_equal 58
      word_score2.must_equal 58
    end

  end

  describe "Scoring#highest_score_from(word_array)" do
    it "raises argument if no words in array" do
      my_array = []
      proc { Scrabble::Scoring.highest_score_from(my_array) }.must_raise ArgumentError
    end

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

    it "chooses first word if tie words are same length" do
      my_array1 = ["love", "qqqq", "zzzz", "heyyy", "word"]
      my_array2 = ["zzzzzzz", "qqqqqqq"]

      Scrabble::Scoring.highest_score_from(my_array1).must_equal "QQQQ"
      Scrabble::Scoring.highest_score_from(my_array2).must_equal "ZZZZZZZ"
    end

  end



end
