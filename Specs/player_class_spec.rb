
require_relative 'spec_helper'
require_relative '../lib/player_class'

describe "Player Class" do

  before do
    @ada = Scrabble::Player.new("@ada")
    @word = "camp"
    @edge_word = "W@ter"
    @array = ["Tweens", "Camp", "toy" ,"Key", "aeiourh", "Doloring"]
    @array2 = ["camp", "pamc", "toy", "love"]
  end

  it "Creates a new instance of player" do
    @ada.must_be_instance_of Scrabble::Player
  end

  it "Raises argumentError if word contains anything other than letters" do

    proc { @ada.play(@edge_word) }.must_raise ArgumentError
  end

  it "Handles if the word passed has a space (two words)" do

    proc { @ada.play("Two Words") }.must_raise ArgumentError
  end

  it "Handles if the word passed has cAmeLCase " do
    @ada.play("cAmeLCase").must_be_kind_of Integer
  end

  it "Play(word) outputs integer" do
    @ada.play(@word).must_be_kind_of Integer
  end

  it "Play(word) outputs the correct score" do
    @ada.play(@word).must_equal 10
  end

  it "Play(word) returns false if player has already won " do
    10.times do
      @ada.play(@word)
    end
   @ada.play(@word).must_equal false
  end


  it "Play(word) adds a word to @plays array" do

    previous_length = @ada.plays.length
    @ada.play("quizzed")
    @ada.plays.length.must_be :>, previous_length
  end


  it " won? returns 'true' if player has greater than or equal to 100 points " do
    skip
    11.times do
      @ada.play(@word)
    end
    @ada.won?.must_equal true
  end

  it " won? returns 'false' if player has less than 100 points " do
    5.times do
      @ada.play(@word)
    end
    @ada.won?.must_equal false
  end


  it " highest_word_score returns the *score* for the highest scoring word" do

    @ada.highest_word_score(@array).must_be_instance_of Integer

  end

  it "highest_scoring_word returns the *word* with the highest score" do
    @ada.highest_scoring_word(@array).must_be_instance_of String
  end

end
