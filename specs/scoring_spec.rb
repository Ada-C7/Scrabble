require_relative 'spec_helper'

require_relative '../lib/scoring.rb'

describe "Wave 1" do
  describe "Scoring class" do
    it "Scrabble module and Scoring class exist" do
      my_scoring = Scrabble::Scoring.new
      my_scoring.must_be_instance_of Scrabble::Scoring
    end
  end


  describe "self.score method" do

    it "accepts a word as input" do
      Scrabble::Scoring.score("frog")
    end

    it "raises an argument error if parameter is not a string" do
      proc { Scrabble::Scoring.score(123) }.must_raise ArgumentError
    end

    it "raises an argument error if any character in string is not a letter" do
      proc { Scrabble::Scoring.score("frog!") }.must_raise ArgumentError
      proc { Scrabble::Scoring.score("fr3og") }.must_raise ArgumentError
    end


    it "returns correct score" do
      Scrabble::Scoring.score("frog").must_equal 8
    end


    it "correctly adds bonus for seven-letter word" do
      Scrabble::Scoring.score("jazzily").must_equal 85
    end

  end



describe "highest score method returns word"do

    it "raises an argument error if parameter is not an array" do
      proc { Scrabble::Scoring.highest_score(123) }.must_raise ArgumentError
    end

    it "raises an argument error if any element in array is not a string" do
      proc { Scrabble::Scoring.highest_score(["cow", 45, "pig"]) }.must_raise ArgumentError
    end

    it "returns word that has the highest score" do
      word_array = ["frog", "jazzily", "pencil"]

      Scrabble::Scoring.highest_score(word_array).must_equal "jazzily"
    end

    it "correctly handles tie by choosing seven-letter word" do
      word_array = ["oysters", "qqqqqq"]
      Scrabble::Scoring.highest_score(word_array).must_equal "oysters" #seven-letter word
    end

    it "correctly handles tie by choosing first seven-letter word" do
      # skip
      word_array = ["nettles", "surlier"]
      Scrabble::Scoring.highest_score(word_array).must_equal "nettles"#first word
    end


    it "correctly handles tie by choosing shorter word" do
      # skip
      word_array = ["wav", "xi"]
      Scrabble::Scoring.highest_score(word_array).must_equal "xi"#shorter word
    end

    it "correctly handles tie by choosing first word in list" do
      # skip
      word_array = ["zizit", "tazza"]
      Scrabble::Scoring.highest_score(word_array).must_equal "zizit" #first word in list
    end
end



end
