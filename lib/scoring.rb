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
      raise ArgumentError.new("That word is too long! Must be 7 characters or less.") if word.length > 7
      word_array = word.upcase.split("")
      word_score = 0

      if word_array.length == 7
        word_score += 50
      end

# if word length is 7, 50 bonus points
      word_array.each do |letter|
        word_score += LETTER_VALUES[letter.to_sym]
      end

      return word_score
    end

# method to add a word and its score (as an array) to the @wordarray (from which high score will be calculated)

# calculating highest score from @wordarray
# method to iterate through wordarray and return word with the highest score
def self.highest_score_from(array_of_words)
  highest_score = 0
  highest_scoring_word = ""
  array_of_words.each do |word|
    word_score = self.score(word)
    if word_score > highest_score
      highest_score = word_score
      highest_scoring_word = word
    end
  end
  return highest_scoring_word
end

# if words are tied, tiebreaker method returns the shorter word
# if multiple words are same length and score, just pick first word



  end
end
