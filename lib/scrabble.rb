module Scrabble

  class Scoring

    def initialize(word)
      word_array = word.split("")
    end


    SCORE_CHART = {
      ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T",] => 1,
      ["D", "G"] => 2,
      ["B", "C", "M", "P"] => 3,
      ["F", "H", "V", "W", "Y"] => 4,
      ["K"] => 5,
      ["J", "K"] => 8,
      ["Q", "Z"] => 10
    }

  end

end
