require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

describe "Player is a class" do
  it "must be type of player" do
    player = Scrabble::Player.new
    player.must_be_instance_of Scrabble::Player
  end

  describe "initialize" do
    #name will be an argument
  end

  describe "name method" do
    it "" do

    end
  end
  describe "plays method" do
    it "" do

    end
  end
  describe "play(word)" do
    it "" do

    end
  end
  describe "total_score" do
    it "" do

    end
  end
  describe "won?" do
    it "" do

    end
  end
  describe "highest_scoring_word" do
    it "" do

    end
  end
  describe "highest_word_score" do
    it "" do

    end
  end

end
