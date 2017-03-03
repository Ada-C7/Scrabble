require_relative '../specs/spec_helper.rb'
require_relative '../lib/scrabble_scoring'

describe "Scoring Class" do

  describe "Scoring is a class" do
    before do
      @my_score = Scrabble::Scoring.new("Happy")
    end

    it "Raises an ArgumentError if param is not a string" do
      proc { Scrabble::Scoring.new(123)}.must_raise ArgumentError
    end

    it "Is class Scoring" do
      @my_score.must_be_instance_of Scrabble::Scoring
    end
  end

  describe "self.score" do

    it "self.score.word returns total score for given word" do
      new_word = Scrabble::Scoring.score("Happy")
      new_word.must_equal 15
    end

    it "Word cannot include symbols or numbers" do
      proc {Scrabble::Scoring.score("@&89")}.must_raise ArgumentError
    end

    it "7 letter word receives a 50 point bonus" do
      word = Scrabble::Scoring.score("Scrabble")
      word.must_equal 64
    end
  end

  describe "self.highest_score_from" do

    it "Raise an ArgumentError if parameter entered isn't an Array" do
      proc { Scrabble::Scoring.highest_score_from("123")}.must_raise ArgumentError
    end

    it "returns the word in the array with the highest score" do
      word_array = ["salad", "cheese", "car"]
      word = Scrabble::Scoring.highest_score_from(word_array)
      word.must_equal "cheese"
    end

    it "returns the word with the fewest letters if a tie occurs" do
      tie_array = ["que", "jaaaa", "dope"]
      Scrabble::Scoring.highest_score_from(tie_array).must_equal "que"
    end

    it "returns the word with 7 letters when tied with top score" do
      winning_words = ["liberty", "xaaaa"]
      Scrabble::Scoring.highest_score_from(winning_words).must_equal "liberty"
    end
  end
end
