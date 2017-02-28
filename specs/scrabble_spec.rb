require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scrabble'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "Scoring Class" do

  describe "Scoring is a class" do
    before do
      @my_score = Scrabble::Scoring.new("Happy")
    end

    it "Takes a word to intialize & is class Scoring" do
      @my_score.must_be_instance_of Scrabble::Scoring
    end

    it "self.score.word returns total score for given word" do
      new_word = Scrabble::Scoring.score("Happy")
      new_word.must_equal 15
    end

    it "Word cannot include symbols or numbers" do
       proc {Scrabble::Scoring.score("@&89")}.must_raise ArgumentError
     end

    it "7 letter word receives a 50 point bonus" do
      skip
    end
  end


end
