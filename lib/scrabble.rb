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

      # Word must have length between 0 and 7, and composed of letters only
      raise ArgumentError.new("Invalid data type entered for word") if word !~ /^[a-zA-Z]{0,7}$/

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
      # Word must be a string data type
      raise ArgumentError.new("Invalid data type entered for array of words") if (array_of_words.class) != Array

      # Word must have length between 0 and 7, and composed of letters only
      array_of_words.each do |word|
        raise ArgumentError.new("Invalid data type entered for array of words: all elements must be string.") if word.class != String

        raise ArgumentError.new("Invalid data type entered for array of words: all elements must be string.") if word !~ /^[a-zA-Z]{0,7}$/
      end

      array_of_scores = array_of_words.map { |word| Scrabble::Scoring.score(word)}
      # Creates an array of score_word_pair arrays
      score_word_pairs = array_of_scores.zip(array_of_words)

      # Creates a new array containing all score_word_pair that have the max score
      max_score = array_of_scores.max
      max_score_word_pairs = score_word_pairs.select { |max_score_word_pair| max_score_word_pair[0] == max_score }

      # No tie case: returns the word with highest score
      return max_score_word_pairs[0][1] if max_score_word_pairs.length == 1

      # For tied cases, it returns the first word in the array with 7 letters
      if max_score_word_pairs.any? { |word_pair| word_pair[1].length == 7 }
        return max_score_word_pairs.select { |word_pair| word_pair[1].length == 7 }.first[1]
      end

      # For ties cases without 7 letter words, it returns the first shortest length word
      min_length = max_score_word_pairs.min_by { |word_pair| word_pair[1].length }[1].length

      return max_score_word_pairs.select { |word_pair| word_pair[1].length == min_length }.first[1]

    end
  end
end
