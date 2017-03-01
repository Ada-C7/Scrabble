require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

#Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble::Scoring" do

  describe "self.score method" do

    it "Creates a new instance of Scoring class" do
      new_score = Scrabble::Scoring.new
      new_score.must_be_instance_of Scrabble::Scoring
    end

    it "score_chart is a hash " do
      Scrabble::Scoring::SCORE_CHART.must_be_instance_of Hash
    end

    it "score_chart associates each letter with it's Scrabble point value" do
      Scrabble::Scoring::SCORE_CHART["e"].must_equal 1
    end

    it "score method retruns an integer" do
      Scrabble::Scoring.score("word").must_be_instance_of Integer
    end

    it "score method raises argument error if input is not a string of lettersr" do
      proc {
        Scrabble::Scoring.score("5")
      }.must_raise ArgumentError
    end

    it "outputs the sum of the letter values" do
      Scrabble::Scoring.score("word").must_equal 8
    end

    it "It is case-insensitive" do
      Scrabble::Scoring.score("wOrD").must_equal 8
    end

    it "For a 7 letter word, adds 50 point bonus" do
      Scrabble::Scoring.score("penguin").must_equal 60
    end
  end


  describe "self.highest_score_from method" do

    it "Returns a word in the given array" do
      words = %w(happy sleepy doc snowwhite snowblack)
      words.must_include Scrabble::Scoring.highest_score_from(words)
    end

    it "Returns the word with the highest score" do
      words = %w(happy sleepy doc snowwhite snowblack)
      Scrabble::Scoring.highest_score_from(words).must_equal "snowblack"
    end

    it "In case of tie, it returns the word with fewest letters" do
      words = %w(jumped sleepy doc klutz zap)
      Scrabble::Scoring.highest_score_from(words).must_equal "klutz"
    end

    it "In case of tie, returns the 7-letter word because of bonus" do
      words = %w(jumped sleepy doc klutz zap zzzzzz aaaaaay)
      Scrabble::Scoring.highest_score_from(words).must_equal "aaaaaay"
    end

    it "In case of tie, when both words have the same number of tiles, return the first word in list" do
      words = %w(sleepy doc klutz zap jacks)
      Scrabble::Scoring.highest_score_from(words).must_equal "klutz"
    end


  end


end

    #puts Scrabble::Scoring.highest_score_from(words)
