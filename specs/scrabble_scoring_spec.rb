require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_scoring'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do
  it "creates a scrabble scoring class" do
    game = Scrabble::Scoring.new
    game.must_be_kind_of Scrabble::Scoring
  end

  it "the class contains a data structure" do
    game = Scrabble::Scoring.new
    game.letters.must_be_kind_of Hash
  end

  it "Raises an ArgumentError when it's not created with alphabets" do
    proc {
      Scrabble::Scoring.new(133)
    }.must_raise ArgumentError
  end

  it "the method self.score(word) should return total score" do
    Scrabble::Scoring.score("yay").must_equal 9
  end
end


describe "highest_score_from" do
  it "Raises an ArgumentError when it's not created with an array" do
    proc {
      Scrabble::Scoring.new("word")
    }.must_raise ArgumentError
  end

  it "retuns the highest scored word from an array" do
    word_arry = ["white", "yellow", "red", "black", "orange", "skyblue", "purple"]
    Scrabble::Scoring.highest_score_from(word_arry).must_equal "skyblue"
  end

  it "returns the word with the fewest letters in the case of a tie " do
    word_arry = ["banjax", "quiz", "red", "blue" ]
    Scrabble::Scoring.highest_score_from(word_arry).must_equal "quiz"
  end

  it "top score is tied between multiple words and one used all seven letters, return the one with seven letters " do
    word_arry = ["banjax", "quiz", "aigbmkk", "blue", "qqqqqq" ]
    Scrabble::Scoring.highest_score_from(word_arry).must_equal "aigbmkk"
  end

  it "If there are multiple words that are the same score and same length, return the first one in the supplied list." do
    word_arry = ["banjax", "kolhoz", "red", "blue" ]
    Scrabble::Scoring.highest_score_from(word_arry).must_equal "banjax"
  end


end
