require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_scoring'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do
it "creates a scrabble scoring class" do
  game_1 = Scrabble::Scoring.new
  game_1.must_be_kind_of Scrabble::Scoring
end

it "the class contains a data structure" do
  game_1 = Scrabble::Scoring.new
  game_1.letters.must_be_kind_of Hash
end

it "the method self.score(word) should output an integer" do
  Scrabble::Scoring.score("yes").must_be_kind_of Integer
end

it "the method self.score(word) should return total score" do
  Scrabble::Scoring.score("yay").must_equal 9
end

it "adds 50 points if 7 tiles are used in one word" do
  Scrabble::Scoring.score("ability").must_equal 62
end

it "the method self.highest_score_from outputs the highest scoring word" do
skip
Scrabble::Scoring.highest_score_from(["hey", "hi", "no"]).must_output "hey"
end

it "selects the word with the least amount of tiles in the case of a score tie" do
  skip
end

it "Picks the first word if there are multiple score ties with same tile count" do
  skip
end


end
