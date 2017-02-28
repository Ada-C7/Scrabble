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
      char_array = word.downcase.split("")

    # convert character array to symbol array

    sym_array = []

    char_array.each do |char|
        sym_array << char.to_sym
    end

    word_score = 0
    sym_array.each do |symbol|
        word_score += letter_scores[symbol]
    end

    if sym_array.length == 7
      word_score += 50
    end
    word_score



    end

    def self.highest_score(word_array)
      score_array = []

      # iterate over word array
      # push each score into matching score array
      word_array.each do |word|
        score_array << score(word)
      end

      return score_array
      # case for one maximum

      # iterate over score array to find highest scores
      # highest_score = 0
      # top_word_index = 0
      # max_index = score_array.each_with_index.max
      # do |score, index|
      #   if score > highest_score
      #     top_word_index = index
      #   end
      # end
      # return word_array[max_index]

      # deal with ties
    end

  end
end
