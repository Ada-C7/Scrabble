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

# test that word is scored correctly
it "Scores word correctly" do
  Scrabble::Scoring.score("moo").must_equal 5
end

# also correct in case of: 7 letter word
# score method returns correct score
# word and score are pushed to @wordarray
# test that highest score method calculates correctly
# test that highest score is returned
# test that highest score handles ties


end
