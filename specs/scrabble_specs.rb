gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe Scrabble::Scoring do
  describe "score" do
    it "returns integer" do
      score_value = Scrabble::Scoring.score("sample")

      score_value.score.must_be_kind_of Integer
    end
  end
end
