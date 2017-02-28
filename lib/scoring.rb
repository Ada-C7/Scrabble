module Scrabble
  class Scoring
    # LETTER_SCORES = { a: 1, c: 3, b: 3, e: 1, d: 2, g: 2, f: 4, i: 1, h: 4, k: 5, j: 8,
    #                 m: 3, l: 1, o: 1, n: 1, q: 10, p: 3, s: 1, r: 1, u: 1, t: 1, w: 4,
    #                 v: 4, y: 4, x: 8, z: 10 }
    LETTER_SCORES = {"a" => 1, "c" => 3, "b" => 3, "e" => 1, "d" => 2, "g" => 2,
             "f" => 4, "i" => 1, "h" => 4, "k" => 5, "j" => 8, "m" => 3,
             "l" => 1, "o" => 1, "n" => 1, "q" => 10, "p" => 3, "s" => 1,
             "r" => 1, "u" => 1, "t" => 1, "w" => 4, "v" => 4, "y" => 4,
             "x" => 8, "z" => 10}

    # attr_reader :letter_scores
    #
    # # refractor this to a constant - go back to strings?
    # def initialize
    #
    # end

    def self.score(word)
      unless word.class == String
        raise ArgumentError.new "Input word must be a string"
      end
      # Not sure how the asterisk works -- inspired from Stack Overflow
      word_score = LETTER_SCORES.values_at(*word.chars).reduce(:+)
      word.length == 7 ? word_score += 50 : word_score
    end
  end
end
