require 'rake/testtask'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'csv'
require_relative '../lib/scoring'

describe "Wave 1" do
  describe "initialize" do

# 	it "instantiates that the word is in our array" do
# 	word.must_be_instance_of
# 	end

    it "verifies that a numeric score is returned" do
      word = Scrabble::Scoring.score("potato")
      word.must_be_kind_of Enumerable
    end

    it "verifies there are max 7 letters" do

    end

    it "adds

    



  end
end
