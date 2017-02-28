module Scrabble
  class Scoring

    SCORE_CHART = {
      "a" => 1,
      "b" => 3,
      "c" => 3,
      "d" => 2,
      "e" => 1,
      "f" => 4,
      "g" => 2,
      "h" => 4,
      "i" => 1,
      "j" => 8,
      "k" => 5,
      "l" => 1,
      "m" => 3,
      "n" => 1,
      "o" => 1,
      "p" => 3,
      "q" => 10,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "u" => 1,
      "v" => 4,
      "w" => 4,
      "x" => 8,
      "y" => 4,
      "z" => 10,
    }


    def self.score(word)
      word_score = 0

      word.each_char do |letter|
        raise ArgumentError.new("Not a letter") if !(SCORE_CHART.keys.include?(letter.downcase))

        word_score += SCORE_CHART[letter.downcase]
      end
      return word_score
    end


  end
end


puts Scrabble::Scoring.score("WorD")
