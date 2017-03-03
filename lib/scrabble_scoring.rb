module Scrabble

  class Scoring
    attr_accessor :word_array, :word, :score_total

    def initialize(word)

      raise ArgumentError.new("Parameters must be strings") if word.class != String

    end

    SCORE_CHART = {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10
    }

    def self.score(word)
      if word =~ /\W/
        raise ArgumentError.new "Please enter a real word!"
      end
      score_total = 0
      word_array = word.upcase.split("")

      word_array.each do |letter|
        score_total += SCORE_CHART[letter]
      end

      if word.length >= 7
        score_total += 50
      end

      return score_total
    end

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("Argument must be an array") if array_of_words.class != Array

      word_scores = {}
      array_of_words.each do |word|
        word_scores[word] = Scrabble::Scoring.score(word)
      end

      winner = []
      word_scores.each do |word, score|
        if score == word_scores.values.max
          winner << word
        end
      end

      winner.each do |winning_word|
        if winning_word.length == 7
          return winning_word
        else
          return winner.min_by {|word| word.length}
        end
      end
    end

  end
end
