module Scrabble
  class Scoring
    SCORE_CHART = {A:1, E:1, I:1, O:1, U:1, L:1, N:1, R:1, S:1, T:1,
      D:2, G:2, B:3, C:3, M:3, P:3, F:4, H:4, V:4, W:4, Y:4, K:5,
      J:8, X:8, Q:10, Z:10}
    def self.score(input_string)
      input_array = input_string.upcase.split("")
      score = input_array.map {|letter| SCORE_CHART[letter.to_sym]}.reduce(:+)
      input_array.length == 7 ? score += 50 : score
    end

    def self.highest_score_from(array_of_words)
      score_array = array_of_words.map {|str| self.score(str)}
      word_score_hash = Hash[array_of_words.zip score_array]

      highest_score_words = word_score_hash.select { |k, v| v == word_score_hash.values.max }.keys
      words_with_length_7 = highest_score_words.find_all {|str| str.length == 7}
      shortest_length = highest_score_words.map { |str| str.length}.min
      words_with_shortest_length = highest_score_words.find_all { |str| str.length == shortest_length}

      words_with_length_7.length == 0 ? words_with_shortest_length.first : words_with_length_7.first
    end
  end # End of class Scoring
end # End of module Scrabble
