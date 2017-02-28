require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scoring class" do

  it "Creates a new instance of Scoring class" do
    score = Scrabble::Scoring.new
    score.must_be_instance_of Scrabble::Scoring
  end

end
