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
      #50 bonus points for 7 letter word
      if word.length >= 7
        score_total += 50
      end
      return score_total
    end

    # returns the word in the array with the highest score

    def self.highest_score_from(array_of_words)
      word_amount = 0
      highest_word = ""
      array_of_words.each do |word|
        if Scrabble::Scoring.score(word) > word_amount
          highest_word = word
          word_amount = Scrabble::Scoring.score(word)
        end
      end

      return highest_word
      # in the case of a tie, prefer the word with the fewest letters.




    end

  end
end
