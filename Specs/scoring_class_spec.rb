require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring_class'

xdescribe "Score Method for Scoring Class" do

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
    Scrabble::Scoring::score("cAmeLCase").must_be :>, 10
  end

  it "Score Method outputs integer" do
    puts Scrabble::Scoring::score(@word).must_be_instance_of Integer
  end

  it "Score method will total the value of each letter in the word" do
    Scrabble::Scoring::score(@word).must_equal 10

  end

  it "Adds a 50 point bonus to a 7 letter word" do
    Scrabble::Scoring::score(@word_7_letters).must_equal 73
  end

  it "adds 50 point bonus on words greater than 7 letters " do
    Scrabble::Scoring::score(@word_8_letters).must_equal 71
  end
end


describe "Highest Score From Method for Scoring Class" do

  describe "highest_score_from nomial" do
    before do
      @edge_word = "W@ter"
      @array = ["camp", "pamc", "toy", "love"]
      @array2 = ["Tweens", "Camp", "toy" ,"Key"] #73
      @fail_array = ["camp", "w@ter", "toy", "love"] #71 #small African antelope
      @super_edge_word = ["Tweens", "Camp", "toy" ,"Key", "aeiourh", "Doloring"]
    end

    it "Raises argumentError if argument is not an array" do
      proc { Scrabble::Scoring::highest_score_from(@edge_word) }.must_raise ArgumentError
    end

    # it "Handles if array had erroneous element , or element that is not a string " do
    #   skip
    #   @word_array.unshift("good", @edge_word,"word")
    #   Scrabble::Scoring::highest_score_from(@word_array)#unknown outcome
    # end

    it "returns the word with the highest score" do
      Scrabble::Scoring::highest_score_from(@array2).must_equal "Key"
    end


    xdescribe " highest_score_from tiebreaking " do

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
