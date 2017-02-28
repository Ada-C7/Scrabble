module Scrabble

  # related to Play class, to be created
  class Scoring

    # constant to hold letter-points
    LETTER_VALUES = {
      A: 1, B: 3, C: 3, D: 2,
      E: 1, F: 4, G: 2, H: 4,
      I: 1, J: 8, K: 5, L: 1,
      M: 3, N: 1, O: 1, P: 3,
      Q: 10, R: 1, S: 1, T: 1,
      U: 1, V: 4, W: 4, X: 8,
      Y: 4,Z: 10
    }

    # method to calculate & return score, given a word as an argument, call add_word method
    def self.score(word)
      raise ArgumentError.new("That is not String.") if word.class != String

      raise ArgumentError.new("That word is too long! Must be 7 characters or less.") if word.length > 7
      word_array = word.upcase.split("")
      word_score = 0

      # if word length is 7, 50 bonus points
      if word_array.length == 7
        word_score += 50
      end

      word_array.each do |letter|
        raise ArgumentError.new("That word includes invalid characters!") if !word.match(/^[a-zA-Z]+$/)
        word_score += LETTER_VALUES[letter.to_sym]
      end

      return word_score
    end

    # method to add a word and its score (as an array) to the @wordarray (from which high score will be calculated)

    # method to iterate through wordarray and return word with the highest score
    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("That's not an array") if array_of_words.class != Array
      highest_score = 0
      winner = ""
      array_of_words.each do |word|
        word_score = self.score(word)
        if word_score > highest_score
          highest_score = word_score
          winner = word
        elsif word_score == highest_score
          self.tiebreaker(word, winner)
        end
      end
      return winner
    end

    # if words are tied, tiebreaker method returns the shorter word
    # if multiple words are same length and score, just pick first word
    def self.tiebreaker(word, winner)
      tie_winner = ""
      if word.length < winner.length
          winner.length == 7 ? tie_winner = winner : tie_winner = word
      elsif word.length > winner.length
          highest_scoring_word.length == 7 ? tie_winner = word : tie_winner = winner
      else
        tie_winner = winner
      end
    end
  end
end
