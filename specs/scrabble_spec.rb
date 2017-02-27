gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Scrabble::Scoring" do

  describe "score" do

    before do
      @score_value = Scrabble::Scoring.score("sample")
    end

    it "returns integer" do
      @score_value.must_be_kind_of Integer
    end

    it "returns correct score for word" do
      @score_value.must_equal 10
    end

    it "raises argument error if word has numbers" do
      proc {
        Scrabble::Scoring.score("123")
      }.must_raise ArgumentError
    end

    it "raises argument error if word has symbols" do
      proc {
        Scrabble::Scoring.score("***")
      }.must_raise ArgumentError
    end
  end
end
