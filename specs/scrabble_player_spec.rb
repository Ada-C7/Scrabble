require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


# Create a Scrabble::Player class with a minimum of 11 specs.
# The only required parameter for instances of the class is the player's name.
#  Instances of the class should repond to the following messages
#  (note, this does not necessarily mean that each of these need to be written as new methods):
#
# #name: returns the value of the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score

describe "Scrabble Player" do

  it "returns the value of the @name instance" do
    a = Scrabble::Player.new("allison")
    a.name.must_equal "allison"
  end

  it "returns an array of played words" do
    a = Scrabble::Player.new("allison")
    a.play("hello").must_be_kind_of Array
  end

  it "returns the correct array of played words" do
    a = Scrabble::Player.new("allison")
    a.play("hello").must_equal ["hello"]
  end

  it "returns an array of played words when calling the plays method" do
    a = Scrabble::Player.new("allison")
    a.plays.must_be_kind_of Array
  end

  it "total_score must return an integer" do
    a = Scrabble::Player.new("allison")
    a.play("yay")
    a.total_score.must_be_kind_of Integer
  end

  it "calculates the correct score" do
    a = Scrabble::Player.new("allison")
    a.play("yay")
    a.total_score.must_be 9
  end

  it "returns the highest scoring word" do
    a = Scrabble::Player.new("allison")
    a.play("yay")
    a.play("hi")
    a.highest_scoring_word.must_be "yay"
  end

  it "adds 50 points if 7 tiles are used in one word" do
    Scrabble::Scoring.score("ability").must_equal 62
  end

  it "selects the word with the least amount of tiles in the case of a score tie" do

    Scrabble::Scoring.highest_score_from(["yay", "hello", "no"]).must_equal "yay"
  end

  it "calculates if the game has been won" do
    a = Scrabble::Player.new("allison")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.play("Oxyphenbutazone")
    a.won?.must_be true
  end

  it "returns false if the game has not been won yet" do
    a = Scrabble::Player.new("allison")
    a.play("yay")
    a.won?.must_be false
  end

  it "raises an argument error if tiles exceed 7" do
    a = Scrabble::Player.new("allison")
    proc { a.tiles(8)
    }.must_raise ArgumentError
  end

  it "pushes the pulled tiles into an array" do
    a = Scrabble::Player.new("allison")
    a.tiles.must_be_kind_of Array
  end











end
