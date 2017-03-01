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
end
