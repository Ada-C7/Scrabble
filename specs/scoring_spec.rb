require_relative 'spec_helper'
require_relative '../lib/scoring'



describe "Scoring" do

  describe "score" do
    
    it "Must return an integer" do
      Scrabble::Scoring.score("word").must_be_instance_of Integer
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

describe "highest_score_from" do
  before do
    @array_of_words = %w(owl chicken duck emu kiwi)
  end

  it "must be an Array that has at least one word" do
    a = []
    proc {
      Scrabble::Scoring.highest_score_from(a)
    }.must_raise ArgumentError
  end

  it "must be an Array" do
    proc { Scrabble::Scoring.highest_score_from("word")}.must_raise ArgumentError
    proc { Scrabble::Scoring.highest_score_from(56)}.must_raise ArgumentError
    proc { Scrabble::Scoring.highest_score_from("")}.must_raise ArgumentError
  end

  it "Returns the String with highest score" do
    Scrabble::Scoring.highest_score_from(@array_of_words).must_equal "chicken"
  end

  it "Shorter word wins if scores are the same" do
    short_words = %w(tins doe it to)
    Scrabble::Scoring.highest_score_from(short_words).must_equal "doe"
  end

  it "7-letter word is the tie-breaker" do
    seven = %w(aaaaaad zzzzzj)
    Scrabble::Scoring.highest_score_from(seven).must_equal "aaaaaad"
  end

  it "returns first 7-letter word" do
    more_sevens = %w(aaaaaad zzzzzj aaaaatg)
    Scrabble::Scoring.highest_score_from(more_sevens).must_equal "aaaaaad"
  end

  it "First word wins if all highest-score words have same length" do
    same = %w(so tins toes it to)
    Scrabble::Scoring.highest_score_from(same).must_equal "tins"
  end
end
