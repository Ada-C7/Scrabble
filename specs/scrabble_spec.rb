require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scrabble'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scoring Class" do

  describe "Scoring is a class" do
    it "Takes a word to intialize & is class Scoring" do
      my_score = Scrabble::Scoring.new("Happy")
      my_score.must_be_instance_of Scrabble::Scoring
    end
  end

end
