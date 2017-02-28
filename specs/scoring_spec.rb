require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'
Minitest::Reporters.use!


describe "Scoring class" do
  it "Creates new instance of Scoring class" do
      Scrabble::Scoring.new.class.must_equal Scrabble::Scoring
  end

  it "Values and letters are stored in a hash" do
    Scrabble::Scoring::LETTERS_VALUES.class.must_equal Hash
  end

  describe "Scoring#score(word)" do
    it "score returns an Integer" do
      Scrabble::Scoring.score("Hello").class.must_equal Integer
    end

    it "raise ArgumentError if parameter is not a string" do
      proc {
        Scrabble::Scoring.score(9)
      }.must_raise ArgumentError

    end

    it "Testing the right values" do
      Scrabble::Scoring.score("H").must_equal 4
      Scrabble::Scoring.score("Z").must_equal 10
      Scrabble::Scoring.score("Hi").must_equal 5
      Scrabble::Scoring.score("com").must_equal 7
      Scrabble::Scoring.score("pu").must_equal 4
      Scrabble::Scoring.score("ter").must_equal 3
    end

    it "50 extra points for 7 letters word" do
      Scrabble::Scoring.score("jacuzzi").must_equal 84
    end

  end # end of score method

  describe "Scoring#highest_score_from" do
    it "returning a string" do
      my_strings = ["Hello", "quizz"]
      Scrabble::Scoring.highest_score_from(my_strings).class.must_equal String
    end

    it "raise an error if parameter is not Array " do
      proc {
        Scrabble::Scoring.highest_score_from(8)
      }.must_raise ArgumentError
    end

    it "Elements in the array must be strings" do
      proc {
        Scrabble::Scoring.highest_score_from([3,4,5])
      }.must_raise ArgumentError
    end

  end




end # end of class
