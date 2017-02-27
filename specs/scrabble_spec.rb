require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scrabble Scoring" do
  describe "Self.score method tests" do
    it "Method can be called without an error" do
      Scrabble::Scoring.must_respond_to :score
    end
  end
end
