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
  game_1.letters.must_be_kind_of Array
end

it "the method self.score(word) should return total score" do
  game_1 = Scrabble::Scoring.new
  game_1.score("yay").must_equal 9
end



end
