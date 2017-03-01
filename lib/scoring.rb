module Scrabble
  class Scoring
    SCORE_CHART = {A:1, E:1, I:1, O:1, U:1, L:1, N:1, R:1, S:1, T:1,
      D:2, G:2, B:3, C:3, M:3, P:3, F:4, H:4, V:4, W:4, Y:4, K:5,
      J:8, X:8, Q:10, Z:10}
    def self.score(input_string)
      input_array = input_string.upcase.split("")
      score = input_array.map {|letter| SCORE_CHART[letter.to_sym]}.reduce(:+)

      if input_array.length == 7
        score += 50
      end

      return score
    end

    def self.highest_score_from(array_of_words)
      score_array = array_of_words.map {|str| self.score(str)}
      word_hash = Hash[array_of_words.zip score_array]

      max_word_array = word_hash.select { |k, v| v == word_hash.values.max }.keys
      max_word_array_7 = max_word_array.find_all {|str| str.length == 7}
      shortest_length = max_word_array.map { |str| str.length}.min
      max_word_array_shortest = max_word_array.find_all { |str| str.length == shortest_length}

      if max_word_array_7.length == 0
        return max_word_array_shortest[0]
      else
        return max_word_array_7[0]
      end
    end

  end # End of class Scoring
end # End of module Scrabble
