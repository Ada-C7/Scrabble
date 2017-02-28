require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/score.rb'

describe "class Scoring" do
  it "reads in DICTIONARY" do
  end

  it "reads in SCORES" do

  end

  describe "is_a_word?" do
    # it exists
    # it returns true or false
    # it returns true if the word is in DICTIONARY
    #it returs false  if the word is not in DICTIONARY

  end

  describe calculating_score do
    # it returns 0 if the word does not exist
    # it returns the right point value for word that is less than 8 letters
    # it adds 50 points if the word is 8 letters
  end
end
