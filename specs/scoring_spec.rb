require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring.rb'

describe "Wave 1" do
  describe "Scoring class" do
    it "Scrabble module and Scoring class exist" do
      my_scoring = Scrabble::Scoring.new
      my_scoring.must_be_instance_of Scrabble::Scoring
    end

  end
end
