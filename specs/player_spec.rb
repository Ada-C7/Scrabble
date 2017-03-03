require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

describe "Wave 2: class Player" do
  it "input argument must be of class String" do
    proc {
      Scrabble::Player.new(12)
    }.must_raise ArgumentError
  end

  it "#name: returns the value of the @name instance variable" do
    player1 = Scrabble::Player.new("Ada")
    player1.name.must_equal "Ada"
  end

  it "#plays: returns an Array of the words played by the player" do
    player1 = Scrabble::Player.new("Maria")
    player1.plays.must_be_kind_of Array
  end

  it "#play(word): Adds the input word to the plays Array" do
    player1 = Scrabble::Player.new("Maria")
    player1.play("hello")
    player1.plays.must_equal ["hello"]
  end

  it "#play(word): Returns the score of the word" do
    player1 = Scrabble::Player.new("Maria")
    player1.play("hello").must_equal 8
  end

  it "#play(word): Returns false if player has already won" do
    player1 = Scrabble::Player.new("Maria")
    played_words = %w(quiz risotto dog) #
    played_words.each do |word|
      player1.play(word)
    end
    player1.play("jinx").must_equal 18
    player1.play("hello").must_equal false
  end

  it "#total_score: Returns the sum of scores of played words" do
    player1 = Scrabble::Player.new("Maria")
    played_words = %w(hello wind fish) #
    played_words.each do |word|
      player1.play(word)
    end
    player1.total_score.must_equal 26
  end

  it "#won?: If the player has over 100 points, returns true, otherwise returns false" do
    player1 = Scrabble::Player.new("Maria")
    played_words = %w(quiz risotto dog) #
    played_words.each do |word|
      player1.play(word)
    end
    player1.won?.must_equal false
    player1.play("jinx")
    player1.won?.must_equal true
  end

  it "#highest_scoring_word: Returns the highest scoring played word" do
    player1 = Scrabble::Player.new("Maria")
    played_words = %w(quiz risotto jinx dog) #
    played_words.each do |word|
      player1.play(word)
    end
    player1.highest_scoring_word.must_equal "risotto"
  end

  it "#highest_word_score: Returns the highest_scoring_word score" do
    player1 = Scrabble::Player.new("Maria")
    played_words = %w(quiz risotto jinx dog) #
    played_words.each do |word|
      player1.play(word)
    end
    player1.highest_word_score.must_equal 57
  end

  it "#tiles is an array" do
    player1 = Scrabble::Player.new("Maria")
    player1.tiles.must_be_kind_of Array
  end

  it "fill tiles until there are 7 letters" do
    tile_bag_in_play = Scrabble::TileBag.new
    player1 = Scrabble::Player.new("Maria", tile_bag_in_play)
    player1.draw_tiles(tile_bag_in_play)
    player1.tiles.length.must_equal 7
  end

  it "tiles left in bag after player draws" do
    tile_bag_in_play = Scrabble::TileBag.new
    player1 = Scrabble::Player.new("Maria", tile_bag_in_play)
    player1.draw_tiles(tile_bag_in_play)
    tile_bag_in_play.tiles_remaining.must_equal 91
  end
end # End of describe "Wave 2: class Player"
