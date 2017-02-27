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

  require 'minitest/autorun'
  require 'minitest/reporters'
  require 'minitest/skip_dsl'

  require_relative '../lib/scoring.rb'


    describe "self.score method" do
      # not yet a functional test
      it "accepts a word as input" do
        Scrabble::Scoring.score
      end

      it "stores the word as an array of characters" do
        Scrabble::Scoring.score("frog")

      end

      it "converts the char array to a symbol array" do

      end

      it "successfully retrieves score for one of the word's letters" do

      end

      it "returns correct score" do

      end

      it "correctly adds bonus for seven-letter word" do

      end




    end


  end

end
