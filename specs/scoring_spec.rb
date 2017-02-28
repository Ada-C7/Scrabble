require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'

describe "scoring" do
  it "Can be initialized" do
    scoring = Scrabble::Scoring.new
    scoring.must_be_instance_of Scrabble::Scoring

  end
end
