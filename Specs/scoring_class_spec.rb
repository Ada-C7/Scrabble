require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring_class'

describe "Score Method for Scoring Class" do

  before do
    @word = "camp"
    @word_7_letters = "quacked" #73
    @word_8_letters = "bushbuck" #71 #small African antelope
    @edge_word = "W@ter"
  end

  it "Raises argumentError if word contains anything other than letters" do
    proc { Scrabble::Scoring::score(@edge_word) }.must_raise ArgumentError
  end

  it "Handles if the word passed has a space (two words)" do
    
    proc { Scrabble::Scoring::score("two words") }.must_raise ArgumentError
  end

  it "Handles if the word passed has cAmeLCase " do
    skip
    Scrabble::Scoring::score("cAmeLCase").must_be :>, 10
  end

  it "Score Method outputs integer" do
    skip
    puts Scrabble::Scoring::score(@word).must_be_instance_of Integer
  end

  it "Score method will total the value of each letter in the word" do
    skip
    Scrabble::Scoring::score(@word).must_equal 10

  end

  it "Adds a 50 point bonus to a 7 letter word" do
    skip
    Scrabble::Scoring::score(@word_7_letters).must_equal 73
  end

  it "adds 50 point bonus on words greater than 7 letters " do
    skip
    Scrabble::Scoring::score(@word_8_letters).must_equal 71
  end
end


describe "Higest Score From Method for Scoring Class" do

  describe "highest_score_from nomial" do
    before do
      @word = "camp" #10
      @word_7_letters = "quacked" #73
      @word_8_letters = "bushbuck" #71 #small African antelope
      @edge_word = "W@ter"
      @word_array = [@word, @word_8_letters, "sunset", @word_7_letters, "Metz"]
    end

    it "Raises argumentError if argument is not and array" do
      skip
      proc { Scrabble::Scoring::highest_score_from(@edge_word) }.must_raise ArgumentError
    end

    it "Handles if array had erroneous element , or element that is not a string " do
      skip
      @word_array.unshit("good", @edge_word,"word")
      Scrabble::Scoring::highest_score_from(@word_array)#unknown outcome
    end

    it "returns the word with the highest score" do
      skip
      Scrabble::Scoring::highest_score_from(@word_array).must_be "quacked"
    end


    describe " highest_score_from tiebreaking " do

      before do
        @tie_array = [ ]
      end

      it "in the case of a tie, prefer the word with the fewest letters" do
        skip
        Scrabble::Scoring::highest_score_from(@tie_array)
      end

      it "Choose the word with seven letters over the one with fewer tiles" do
        skip
        Scrabble::Scoring::highest_score_from(@tie_array).length.must_equal 7
      end

      it "Pick the first word in array if ties are the same score and same length" do
        skip
        Scrabble::Scoring::highest_score_from(@tie_array)
      end

      it "Still adds 50 point bonus on words greater than 7 letters " do
        skip
        Scrabble::Scoring::highest_score_from(@tie_array).score.must_be :>, 50
      end
    end
  end
end
