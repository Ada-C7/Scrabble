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
      10 => %W(Q Z)
    }

    # Calculates and returns the total score for the given word
    def self.score(word)
      # Word must be a string data type
      raise ArgumentError.new("Invalid data type entered for word") if (word.class) != String
      # Word length must be 7 or less
      raise ArgumentError.new("Invalid word length: word length <= 7") if word.length > 7

      word_score = 0
      char_array = word.upcase.chars.to_a
      char_array.each do | letter |
        SCORE_CHART.each_pair { | score, letter_group_array | word_score += score if letter_group_array.include?(letter) }
      end

      # Addtional score of 50 points if all 7 letters were used
      word_score += 50 if word.length == 7
      return word_score
    end

    def self.highest_score_from(array_of_words)
      # Parameter must be an array
      score_length_pair = []
      return ""
    end

  end
end
