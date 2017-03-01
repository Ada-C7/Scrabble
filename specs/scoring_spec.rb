require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring.rb'


describe "Scoring" do
  describe "score" do
    # let (:scoring) {Scrabble::Scoring.new}
    # it "Can be initialized" do
    #   # scoring = Scrabble::Scoring.new
    #   scoring.must_be_instance_of Scrabble::Scoring
    # end
    it "returns an integer" do
      score = Scrabble::Scoring.score("a")
      score.must_be_instance_of Integer

    end

    it "returns the correct scrabble score for a given letter" do
      Scrabble::Scoring.score("A").must_equal 1
      Scrabble::Scoring.score("F").must_equal 4
    end

    it "returns the total score for a given word" do
      Scrabble::Scoring.score("FACE").must_equal 9
      Scrabble::Scoring.score("TREE").must_equal 4
    end

    it "returns the total score for a given word regardless of word case" do
      Scrabble::Scoring.score("TRaVEL").must_equal 9

    end

    it "adds 50 points to the total socre if the word length is 7 letters" do
      Scrabble::Scoring.score("TRAVELS").must_equal 59
    end

    it "raises an argument error if input is other than string of letters" do
      #the input is not a string"
      proc {
        Scrabble::Scoring.score(78)
      }.must_raise ArgumentError

      #the given word is > 7 letters"
      proc {
        Scrabble::Scoring.score("ELEPHANT")
      }.must_raise ArgumentError

      # the given word contains characters other than a to z
      proc {
        Scrabble::Scoring.score("V7RT8")
      }.must_raise ArgumentError
      # handle empty string too
      proc {
        Scrabble::Scoring.score("")
      }.must_raise ArgumentError
    end
  end

  describe "highest_score_from" do
    it "raises an argument error if the input is not an array of strings" do
      #check that input is an array
      #check that each element in the array is a string
    end

    it "raises an arugment error if a given word contains characters other than a to z" do

    end

    it "returns a string" do

    end

    it "returns the word with the hightest score" do

    end

    it "returns the word with fewest letters if there is a tie (no 7 letter words)" do

    end

    it "returns the 7 letter word in the case of a tie" do

    end

    it "returns the first word if there is a tie between score and length" do

    end
  end
end

# define_method(:scrabble_score) do
# 		scrabble_word = self.split("")
# 		scrabble_score = 0
#
# 		scrabble_word.each() do |letter|
# 			case letter
# 			when "a", "A", "e", "E", "i", "I", "o", "O", "u", "U", "l", "L", "n", "N", "r", "R", "s", "S", "t", "T"
# 				scrabble_score = scrabble_score.+(1)
# 			when "d", "D", "g", "G"
# 				scrabble_score = scrabble_score.+(2)
# 			when "b", "B", "c", "C", "m", "M", "p", "P"
# 				scrabble_score = scrabble_score.+(3)
# 			when "f", "F", "h", "H", "v", "V", "w", "W", "y", "Y"
# 				scrabble_score = scrabble_score.+(4)
# 			when "k", "K"
# 				scrabble_score = scrabble_score.+(5)
# 			when "j", "J", "x", "X"
# 				scrabble_score = scrabble_score.+(8)
# 			when "q", "Q", "z", "Z"
# 				scrabble_score = scrabble_score.+(10)
# 			else
# 				scrabble_score
# 			end
# 		end
# 		scrabble_score
