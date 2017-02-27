module Scrabble
  class Scoring
    # Class constant stores the letters and their repective scores
    SCORE_CHART = {
      1 => %w(A E I O U L N R S T),
      2 => %W(D G),
      3 => %W(B C M P),
      4 => %W(F H V W Y),
      5 => %W(K),
      8 => %W(J X),
      10 => %W(Q Z),
    }

    # Calculates and returns the total score for the given word
    def self.score(word)
      raise ArgumentError.new("Invalid data type entered for word") if (word.class) != String
      word_score = 0

      char_array = word.upcase.chars.to_a
      return word_score
    end

    def self.highest_score_from(array_of_words)
      score_length_pair = []
      return ""
    end

  end
end
