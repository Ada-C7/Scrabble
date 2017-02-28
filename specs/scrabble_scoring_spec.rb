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

<<<<<<< HEAD
  it "the class contains a data structure" do
    game_1 = Scrabble::Scoring.new
    game_1.letters.must_be_kind_of Hash
  end

  it "the method self.score(word) should return total score" do
    Scrabble::Scoring.score("yay").must_equal 9
  end
=======
it "the class contains a data structure" do
  game_1 = Scrabble::Scoring.new
  game_1.letters.must_be_kind_of Hash
end

it "the method self.score(word) should return total score" do
  Scrabble::Scoring.score("yay").must_equal 9
end
>>>>>>> 4013dc041c71e7a8c2bcb5e6ac145594b1cb48a1

  it "Seven letter words receive a 50 point bonus" do
    Scrabble::Scoring.score("aaaaaaa").must_equal 57
  end


end
