require_relative 'spec_helper'
require_relative '../lib/player.rb'

describe "Player is a class" do
  it "must be type of player" do
    player = Scrabble::Player.new("name")
    player.must_be_instance_of Scrabble::Player
  end

  describe "initialize" do
    #name will be an argument
    it "Raise error if parameter is not string class type for the name " do
      all_other_things = [17, [], {}, nil]

      all_other_things.each do |class_type|
        proc {
          Scrabble::Player.name(class_type)
        }.must_raise ArgumentError
      end
    end
    it "It returns the name" do
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
