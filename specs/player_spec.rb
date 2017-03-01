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
          Scrabble::Player.new(class_type)
        }.must_raise ArgumentError
      end
    end


    it "It returns the name" do
      test_name = "George"
      player = Scrabble::Player.new(test_name)
      player.name.must_equal "George"
    end
  end

  describe "plays method" do
    before do
      test_name = "George"
      @player = Scrabble::Player.new(test_name)
    end

    it "is an array" do
      @player.plays.must_be_kind_of Array
    end

    it "contains only strings" do
      @player.plays.each do |word|
        word.must_be_kind_of String
      end
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
