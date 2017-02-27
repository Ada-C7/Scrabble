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
    @scrabble.score_chart.must_be_instance_of Hash
  end

  it "Iterates through the Hash key correctly" do
    @scrabble.letter_value("A").must_equal 1
    @scrabble.letter_value("D").must_equal 2
    @scrabble.letter_value("K").must_equal 5
  end
end
