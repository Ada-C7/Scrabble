require 'simplecov'
SimpleCov.start

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

  describe "Scoring#input_correct" do
    it "Must return false if input has digits" do
      Scrabble::Scoring.input_correct?("word1").must_equal false
    end
  end

  describe "Scoring#score(word)" do
    it "Score returns an Integer" do
      Scrabble::Scoring.score("Hello").class.must_equal Integer
    end
    it "Raises ArgumentError if parameter is not a string" do
      proc {
        Scrabble::Scoring.score(9)
      }.must_raise ArgumentError
    end
    it "Raises ArgumentError if string parameter has number " do
      proc {
        Scrabble::Scoring.score("9")
      }.must_raise ArgumentError
    end
    it "Returns the right values" do
      Scrabble::Scoring.score("H").must_equal 4
      Scrabble::Scoring.score("Z").must_equal 10
      Scrabble::Scoring.score("Hi").must_equal 5
      Scrabble::Scoring.score("com").must_equal 7
      Scrabble::Scoring.score("pu").must_equal 4
      Scrabble::Scoring.score("ter").must_equal 3
    end
    it "Adds 50 extra points for 7 letters word" do
      Scrabble::Scoring.score("jacuzzi").must_equal 84
    end
  end # end of score method

  describe "Scoring#find_max" do
    it "Returns an array" do
      my_strings = ["Hello", "quizz"]
      Scrabble::Scoring.find_max(my_strings).class.must_equal Array
    end
    it "Returns the word with the max score" do
      my_strings = ["Hello", "quizz"]
      Scrabble::Scoring.find_max(my_strings).must_equal ["quizz"]
    end
    it "Returns the words with the max score" do
      my_strings = ["Hello", "quizz", "qqqd"]
      Scrabble::Scoring.find_max(my_strings).must_equal ["quizz", "qqqd"]
    end
  end

  describe "Scoring#tie" do
    it "raise ArgumentError if parameter is not an array." do
      proc {
        Scrabble::Scoring.tie("max_words")
      }.must_raise ArgumentError
      proc {
        Scrabble::Scoring.tie(999)
      }.must_raise ArgumentError
    end
    it "Returns an Array" do
      Scrabble::Scoring.tie(["J", "X"]).class.must_equal String
    end
    it "Returns first word if words both have 7 characters and same value" do
      Scrabble::Scoring.tie(["quizzes", "qqqaaaa"]).must_equal "quizzes"
    end
    it "Returns word with 7 characters, if the values are the same" do
      Scrabble::Scoring.tie(["quizzes", "qqqqqqqqf"]).must_equal "quizzes"
    end
  end

  describe "Scoring#highest_score_from" do
    it "Returns a string" do
      my_strings = ["Hello", "quizz"]
      Scrabble::Scoring.highest_score_from(my_strings).class.must_equal String
    end
    it "Raises an error if passing parameter is not Array " do
      proc {
        Scrabble::Scoring.highest_score_from(8)
      }.must_raise ArgumentError
    end
    it "Elements in the array must be strings" do
      proc {
        Scrabble::Scoring.highest_score_from([3,4,5])
      }.must_raise ArgumentError
    end
    it "Testing the highest score of array" do
      my_array = ["hello", "table", "ball", "martini", "quizzes", "computer"]
      Scrabble::Scoring.highest_score_from(my_array).must_equal "quizzes"
    end
    it "Returns the shortest word in case of tie and no 7 long word." do
      my_array = ["kkk", "qk"]
      Scrabble::Scoring.highest_score_from(my_array).must_equal "qk"
    end
  end
end # end of class
