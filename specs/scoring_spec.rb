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

  describe "#is_a_word?" do
    # it exists
    # it returns true or false
    # it returns true if the word is in DICTIONARY
    #it returs false  if the word is not in DICTIONARY

  end

  describe calculating_score do

    # it returns the right point value for word that is less than 8 letters
    # it adds 50 points if the word is 8 letters
  end

  describe "self.score" do
    # it returns the score of the word if is_a_word is true
    # it returns 0 if the word does not exist
  end

  describe "break_ties" do
    # it takes 2 words as params
    # it compares the length of two words if word1 is bigger than word2, it returns word1 else, word2.
  end

  describe "self.highest_score_from" do
    # it tests if there is a single word, it will be returned as the best word.
    # it returns the shortest word as the best word if there is more than one best word
    # if returns the first word if there are more than one word with same length.
  end
end
