require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Baseline" do
  before do
    @scrabble = Scrabble::Scoring.new
  end

  it "Creates an instance of the Scrabble class" do
    @scrabble.must_be_instance_of Scrabble::Scoring
  end

  it "Initializes with a hash" do 
  skip
  end

  it "Iterates through the Hash key correctly" do
    skip
  end
end
