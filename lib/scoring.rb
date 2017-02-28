module Scrabble
  class Scoring
    attr_reader :word_score
    SCORE_CHART = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    def initialize
    end

    def self.score(word)
      letter_score = 0
      @word_score = 0
      word.each_char do |letter|
        SCORE_CHART.each do |number, alpha|
          if alpha.include?(letter.upcase)
            letter_score = number
          end
          @word_score += letter_score
        end
      end
      return @word_score
    end
  end
end

# print Scrabble::Scoring.score("rabbit")
