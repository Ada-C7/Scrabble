module Scrabble
  class Scoring

    def self.score(word)
      letter_scores = {
        a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1,
        d: 2, g: 2,
        b: 3, c: 3, m: 3, p: 3,
        f: 4, h: 4, v: 4, w: 4, y: 4,
        k: 5,
        j: 8, x: 8,
        q: 10, z: 10
      }

      #store word as characters in array
      char_array = word.split("")

    # convert character array to symbol array

    sym_array = []

    char_array.each do |char|
        sym_array << char.to_sym
    end

    score = 0
    sym_array.each do |symbol|
        score += letter_scores[symbol]
    end
    score


    end
end
end
