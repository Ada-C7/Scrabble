require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Scoring" do

  describe "score" do
    before do
      @score = Scrabble::Scoring.score("word")
    end

    it "Must return an integer" do
      @score.must_be_instance_of Integer
    end

    it "Must receive String of letters as input" do
      proc {
        Scrabble::Scoring.score("5h7")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.score("bats?")
      }.must_raise ArgumentError

      proc {
        Scrabble::Scoring.score("Hello mom")
      }.must_raise ArgumentError


    end

    it "7-letter words must get 50 more points" do
      @score_check = Scrabble::Scoring.score("penguin")
      @score_check.must_equal 60 #10 points plus 50 bonus

      @score_check = Scrabble::Scoring.score("chicken")
      @score_check.must_equal 68 #10 points plus 50 bonus
    end

    it "Must return correct score for word input" do
      @score_check = Scrabble::Scoring.score("falcon")
      @score_check.must_equal 11

      @score_check = Scrabble::Scoring.score("jay")
      @score_check.must_equal 13

      @score_check = Scrabble::Scoring.score("quail")
      @score_check.must_equal 14
    end
  end
end
