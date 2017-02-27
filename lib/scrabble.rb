module Scrabble

  class Scoring
      SCORE_CHART = {
        ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
        ["D", "G"] => 2,
        ["B", "C", "M", "P"] => 3,
        ["F", "H", "V", "W", "Y"] => 4,
        ["K"] => 5,
        ["J", "X"] => 8,
        ["Q", "Z"] => 10
      }

    def self.letter_value(letter)
      SCORE_CHART.each do |array, value|
        if array.include?(letter)
          return value
        end
      end
    end

  end

end
