require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scoring class" do

  it "Creates a new instance of Scoring class" do
    score = Scrabble::Scoring.new
    score.must_be_instance_of Scrabble::Scoring
  end

  it "Compares word to score chart by each letter" do

  end

  it "Adds up the score" do

  end

  it "Adds 50 bonus points for a seven-letter word" do
    
  end


end
