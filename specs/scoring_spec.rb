require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble::Scoring" do

  # before do
  #   @game = Scrabble::Scoring.new
  # end

  # test if letters have correct values attached
  it "Letters have correct values" do
    Scrabble::Scoring::LETTER_VALUES[:A].must_equal 1
    Scrabble::Scoring::LETTER_VALUES[:B].must_equal 3
    Scrabble::Scoring::LETTER_VALUES[:K].must_equal 5
    Scrabble::Scoring::LETTER_VALUES[:Z].must_equal 10
  end

# check that word is no more than 7 letters long
it "Word is 7 letters or less" do
  proc {
  Scrabble::Scoring.score("supercalifragilistic")}.must_raise ArgumentError
end

# test that word is scored correctly and returns that score
it "Scores word correctly" do
  Scrabble::Scoring.score("moo").must_equal 5
end

# also correct in case of: 7 letter word
it "Scores 7-letter word correctly" do
  Scrabble::Scoring.score("hipster").must_equal 62
end

# word and score are pushed to @wordarray
# it "adds new word & score element to words array" do
#   Scrabble::Scoring.score("moo")
# end
# it "adds multiple word & score elements to words array" do
# Scrabble::Scoring.score("moo")
# Scrabble::Scoring.score("hipster")
# end

# test that highest score method calculates correctly
# test that highest score is returned
it "Scores all words correctly and returns highest scoring word" do
Scrabble::Scoring.highest_score_from(["moo", "hipster", "hippo", "muzjiks"]).must_equal "muzjiks"
end

# test that highest score handles ties
it "Handles ties correctly" do
  Scrabble::Scoring.highest_score_from(["cat", "bat", "l", "a"]).must_equal "cat"
end

it "Handles 7 letter word ties correctly" do
  Scrabble::Scoring.highest_score_from(["cat", "moooooo", "fb"]).must_equal "moooooo"
end

end
