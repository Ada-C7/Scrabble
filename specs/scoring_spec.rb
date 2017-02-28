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
    it "returns a scrabble score for any given letter" do
      Scrabble::Scoring.score("a").must_equal 1
      Scrabble::Scoring.score("f").must_equal 4

    end

    it "returns a scrabble score of a word" do

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
