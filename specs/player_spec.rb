require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/player'

describe "Player Class" do
  describe "tests tehut wrote" do
    describe "Test that Player Class exists" do
      it "exists" do
        tofu = Scrabble::Player.new
        # skip
        tofu.class.must_be_kind_of Class
      end
    end

    describe "Player class has a name" do
      it "Will return a string when .name is called" do
        tofu = Scrabble::Player.new
        tofu.name.must_be_kind_of String
      end
    end

      describe ".plays initializes as an array" do
        it "is an array upon instantiation" do
          tofu = Scrabble::Player.new
          tofu.plays.must_be_kind_of Array
        end
      end


    describe "Test the .play Method" do
      describe "Test play method returns an array" do
          it "will return an array when called" do
            tofu = Scrabble::Player.new
            tofu.play("snow").must_be_kind_of Array
          end
        end

      describe ".play(word) returns the score" do
        it "returns the score if won == false" do
          tofu = Scrabble::Player.new
          tofu.play("snow").must_equal 7 if tofu.win? == false
        end
      end

      describe ".play(word) returns false if player has won" do
        it "returns false if .win? == true" do
            tofu = Scrabble::Player.new
            tofu.play("snow").must_equal false if tofu.win? == true
        end
      end

  end
  
  describe "total_score method" do
    it "returns the correct score" do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("apple")
      ginny.total_score.must_equal 18
    end
  end

  describe "highest_scoring_word" do
    it "returns a string" do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("peaches")
      ginny.highest_scoring_word.must_be_kind_of String
    end
    it "returns the correct value" do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("peaches")
      ginny.highest_scoring_word.must_equal "peaches"
    end
  end

  describe "highest_word_score" do
    it "returns an integer" do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("peaches")
      ginny.highest_word_score.must_be_kind_of Integer
    end
    it "returns the correct value" do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("peaches")
      ginny.highest_word_score.must_equal 64
    end
  end
end
