require 'csv'

module Scrabble
  class Scoring
     @@tiles = {}

    CSV.read("./support/scoring.csv").each do |line|
        @@tiles[line[0]] = line[1].to_i
      end

    # {
    #   "A" => 1,
    #   "E" => 1,
    #   "I" => 1,
    #   "O" => 1,
    #   "U" => 1,
    #   "L" => 1,
    #   "N" => 1,
    #   "R" => 1,
    #   "S" => 1,
    #   "T" => 1,
    #   "D" => 2,
    #   "G" => 2,
    #   "B" => 3,
    #   "C" => 3,
    #   "M" => 3,
    #   "P" => 3,
    #   "F" => 4,
    #   "H" => 4,
    #   "V" => 4,
    #   "W" => 4,
    #   "Y" => 4,
    #   "K" => 5,
    #   "J" => 8,
    #   "X" => 8,
    #   "Q" => 10,
    #   "Z" => 10
    # }


    def self.score(word)
      raise ArgumentError.new "That word is invalid" if word.length > 7 || word.length == 0

      if (word =~ /^[a-zA-Z]+$/) != 0
        raise ArgumentError.new "That's not a word."
      end

      word.upcase!

      score = 0

      word.each_char do |letter|
        score += @@tiles[letter]
      end

      if word.length == 7
        score += 50
      end

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
