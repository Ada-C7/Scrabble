require_relative 'spec_helper'
require_relative '../lib/player'

describe "Wave 2" do
  before do
    @player = Scrabble::Player.new("Mary")
  end

  describe "Player#initialize" do

    it "Takes a name" do
      @player.must_respond_to :name
    end

    it "returns an Array of the words played by the player" do
      @player.must_respond_to :plays
      @player.plays.must_be_instance_of Array
    end

  end

  describe "Player#play" do
    it "Adds the input word to the plays Array" do
      @player.play("hello")
      @player.plays.must_include "HELLO"
    end

    it "returns score of the word played" do
      @player.play("hello").must_equal Scrabble::Scoring.score("hello")
    end

  describe "Player#total_score" do
    it "Returns the sum of scores of played words" do
      @player.play("green")
      @player.play("hello")
      
      @player.total_score.must_equal Scrabble::Scoring.score("green") + Scrabble::Scoring.score("hello")
    end
  end

  end
end
