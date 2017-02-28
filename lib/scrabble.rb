module Scrabble

  class Scoring
    attr_accessor :word_array, :word

    def initialize(word)
      # @word_array = word_array

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
      return score_total
    end

    def self.highest_score_from(array_of_words)
    end

  end
end
