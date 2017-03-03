require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'
Minitest::Reporters.use!


describe "Player class" do
  describe "Player#initialize" do
    it "Creates an instance of Player class" do
      Scrabble::Player.new("Natalia").class.must_equal Scrabble::Player
    end
    it "Takes name as parameter" do
      player = Scrabble::Player.new("Natalia")
      player.must_respond_to :name
    end
    it "Creates an empty array to store player's words" do
      player = Scrabble::Player.new("Natalia")
      player.plays.class.must_equal Array
      player.plays.must_be_empty
    end
  end

  describe "Player#play(word)" do
    it " Returns integer value " do
      player = Scrabble::Player.new("Natalia")
      player.play("flower").class.must_equal Integer
    end
    it "Saves word in @plays array" do
      player = Scrabble::Player.new("Natalia")
      player.play("flower")
      player.plays.must_include "flower"
    end
    it "Return false if player won " do
      player = Scrabble::Player.new("Natalia")
      player.play("flower")
      player.play("quizzes")
      player.play("hello")
      player.play("computer").must_equal false
    end
    it "Raise error if word cannot be scored" do
      proc {
        player = Scrabble::Player.new("Natalia")
        player.play("sd234ddm") }.must_raise ArgumentError
      end
    end

    describe "Player#total_score" do
      it "returns an integer" do
        player = Scrabble::Player.new("Natalia")
        player.play("flower")
        player.total_score.class.must_equal Integer
      end

      it "Returns total score of words" do
        player = Scrabble::Player.new("Natalia")
        player.play("flower")
        player.play("hello")
        player.total_score.must_equal 20
      end

      it "Returns 0 if plays array is empty" do
        player = Scrabble::Player.new("Natalia")
        player.total_score.must_equal 0
      end
    end

    describe "Player#won?" do
      it "Returns true if total score > 100" do
        player = Scrabble::Player.new("Natalia")
        player.play("flower")
        player.play("quizzes")
        player.play("hello")
        player.won?.must_equal true
      end

      it "Returns false if total score < 100" do
        player = Scrabble::Player.new("Natalia")
        player.play("flower")
        player.play("hello")
        player.won?.must_equal false
      end
    end#end won?

    describe "Player#highest_scoring_word" do
      it "Must return a string with the highest scoring" do
        player = Scrabble::Player.new("Natalia")
        player.play("word")
        player.play("quizz")
        player.highest_scoring_word.class.must_equal String
        player.highest_scoring_word.must_equal "quizz"
      end
    end

    describe "Player#highest_word_score" do
      it "Must return score of the highest_scoring_word" do
        player = Scrabble::Player.new("Natalia")
        player.play("word")
        player.play("quizzes")
        player.highest_word_score.class.must_equal Integer
        player.highest_word_score.must_equal 84
      end
    end

    describe "Player#tiles" do
      it "return an empty array" do
        Scrabble::Player.new("laura").tiles.class.must_equal Array
        Scrabble::Player.new("laura").tiles.must_be_empty

      end

    end


  end # end of class
