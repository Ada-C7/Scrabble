module Scrabble
  attr_reader :score
  class Scoring
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
      word.each_char do |letter|
        SCORE_CHART.each do |number, alpha|
          if alpha.includes?(letter)
            letter_score = number
          end
          score += letter_score
        end
        return score
      end
    end
  end
end

print Scrabble.score("rabbit")
