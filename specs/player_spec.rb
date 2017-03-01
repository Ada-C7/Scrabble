require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/player'

describe "Player Class" do
before do  "Create an instance"
  tofu = Scrabble::Player.new

  describe "Module Scrabble, Player Class" do
    it "exists" do
      # skip
      tofu.class.must_be_kind_of Class
    end

  describe "Player class has a name" do
    it "Will return a string when .name is called"
    tofu.name.must_be_kind_of String
    end
  end



  end

  describe "method tests Anna wrote" do
    before do
      ginny = Scrabble::Player.new
      ginny.play("apple")
      ginny.play("peaches")
    end
    
    describe "total_score method" do
      it "returns the correct score" do
        ginny.total_score.must_equal 73
      end
    end

    describe "highest_scoring_word" do
      it "returns a string" do
        ginny.highest_scoring_word.must_be_kind_of String
      end
      it "returns the correct value" do
        ginny.highest_scoring_word.must_equal "peaches"
      end
    end

    describe "highest_word_score" do
      it "returns an integer" do
        ginny.highest_word_score.must_be_kind_of Integer
      end
      it "returns the correct value" do
        ginny.highest_word_score.must_equal 64
      end
    end
  end






end
