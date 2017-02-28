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


  describe "self.score method" do
    # not yet a functional test
    it "accepts a word as input" do
      Scrabble::Scoring.score("frog")
    end

    it "stores the word as an array of characters" do
        skip
        char_array = Scrabble::Scoring.score("Frog")

        char_array.must_equal ["f","r","o","g"]

    end

    it "converts the char array to a symbol array" do
      skip
      sym_array = Scrabble::Scoring.score("frog")

      sym_array.must_equal [:f, :r, :o, :g]
    end


    it "returns correct score" do
      Scrabble::Scoring.score("frog").must_equal 8
    end


    it "correctly adds bonus for seven-letter word" do
      Scrabble::Scoring.score("jazzily").must_equal 85
    end

  end



describe "highest score method returns word"do

    it "returns word that has the highest score" do
    word_array = ["frog", "jazzily", "pencil"]

    Scrabble::Scoring.highest_score(word_array).must_equal "jazzily"
end
end



end
