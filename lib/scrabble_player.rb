# Create a Scrabble::Player class with a minimum of 11 specs.
# The only required parameter for instances of the class is the player's name.
# Instances of the class should repond to the following messages
# (note, this does not necessarily mean that each of these need to be written as new methods):
#
# XXXX#name: returns the value of the @name instance variable
# XXXX#plays: returns an Array of the words played by the player
# XXXX#play(word): Adds the input word to the plays Array
# Returns false if player has already won
# XXXXReturns the score of the word
# XXXX#total_score: Returns the sum of scores of played words
# XXXX#won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score
require_relative 'scrabble_scoring'

module Scrabble
  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
      @played_words = []
      @total = []
    end

    def play(word)
      # @played_words = []
      #empty array for the number of plays
      # raise ArgumentError.new("You already won!") if @total.inject(:+) > 100
      @total << Scrabble::Scoring.score(word)
      @played_words << word
      return @played_words
    end

    def total_score
      return @total.inject(:+)
    end

    # def highest_scoring_word
    #   print Scrabble::Scoring.highest_score_from(@played_words)
    # end

    def won?
      total = @total.inject(:+)
      if total > 100
        return true
      else
        false
      end
    end
  end
end

new_game = Scrabble::Player.new("allison")
new_game.play("hello")
new_game.play("how")
# new_game.highest_scoring_word
new_game.total_score
new_game.won?
