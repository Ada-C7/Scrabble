require 'csv'

module Scrabble
  class Scoring
    @@tiles = {}

    CSV.read("./support/scoring.csv").each do |line|
      @@tiles[line[0]] = line[1].to_i
    end

    def self.score(word)
      raise ArgumentError.new "That words can't be longer than 7 letters." if word.length > 7
      raise ArgumentError.new "Words must have at least one letter." if word.length == 0
      raise ArgumentError.new "Words must only have letters." if (word =~ /^[a-zA-Z]+$/) != 0

      word.upcase!
      score = 0

      word.chars.each { |letter| score += @@tiles[letter] }

      score += 50 if word.length == 7

      return score
    end

    def self.highest_score_from(array_of_words)

      high_score_word = array_of_words.max_by { |word| score(word) }
      high_score = score(high_score_word)

      highest_score_words = array_of_words.select { |word| score(word) == high_score }


      if highest_score_words.length == 1
        return highest_score_words[0]
      else
        return highest_score_words.min_by do |word|
          return word if word.length == 7
          word.length
        end
      end
    end


  end
end

Scrabble::Scoring.highest_score_from([ "blue", "gum", "bumble", "feet"])
#puts Scrabble::Scoring.score("green")

    #
    # Create a Scrabble module at the project root.
    # Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below.
    # Create a Spec file which corresponds to your Scrabble::Scoring class. This spec should contain one red test as a starting point (this test can be modified as your get further through the requirements).
    # Be able to execute your one test using rake from the project root.
