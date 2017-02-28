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
