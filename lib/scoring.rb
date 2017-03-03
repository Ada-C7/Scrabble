module Scrabble

  class Scoring

    LETTER_VALUES = {
      A: 1, B: 3, C: 3, D: 2,
      E: 1, F: 4, G: 2, H: 4,
      I: 1, J: 8, K: 5, L: 1,
      M: 3, N: 1, O: 1, P: 3,
      Q: 10, R: 1, S: 1, T: 1,
      U: 1, V: 4, W: 4, X: 8,
      Y: 4,Z: 10
    }

    def self.score(word)
      raise ArgumentError.new("That is not String.") if word.class != String
      raise ArgumentError.new("That word includes invalid characters!") if !word.match(/^[a-zA-Z]+$/)
      raise ArgumentError.new("That word is too long! Must be 7 characters or less.") if word.length > 7

      word_array = word.upcase.split("")
      word_score = 0

      if word_array.length == 7
        word_score += 50
      end

      word_array.each do |letter|
        word_score += LETTER_VALUES[letter.to_sym]
      end

      return word_score
    end

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("That's not an array") if array_of_words.class != Array
      winner = ""

      highest_score = 0
      array_of_words.each do |word|
        word_score = self.score(word)
        if word_score > highest_score
          highest_score = word_score
          winner = word
        elsif word_score == highest_score
          self.tiebreaker(word, winner)
        end
      end

        # attempt at adding words + scores to a hash to keep
        # could be used in a method to add a word and its score (as an array) to the @wordarray (from which high score will be calculated)
        # winner_score = 0
        # scores = {}
        # array_of_words.each do |word|
        #   word_score = self.score(word)
        #   scores[word] = word_score
        # end
        # scores.each do|word, score|
        #   winner = word if score == scores.values.max
        #   winner_score = scores.values.max
        # end
        # scores.find_all { |word, score| score == winner_score }

      return winner
    end

    def self.tiebreaker(word, winner)

      if winner.length == 7 || word.length == 7
        winner.length <= word.length ? tie_winner = word : tie_winner = winner
      else
        word.length <= winner.length ? tie_winner = winner : tie_winner = word
      end

    end

  end
end
