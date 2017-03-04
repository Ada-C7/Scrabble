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

      word.length == 7 ? word_score = 50 : word_score = 0

      word.upcase.each_char do |letter|
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

      return winner


      # STARTED BUT DIDN'T FINISH
      #
      # word_scores = array_of_words.map { | word | self.score(word) }
      #
      # word_plus_score = array_of_words.zip(word_scores).to_h
      #
      # max_score_count = word_plus_score.values.count(word_plus_score.values.max)
      #
      # tiebreaker if max_score_count > 1
      #
      # winning_score = word_plus_score.max_by { | word, score | score }[1]
      # winning_word = word_plus_score.max_by { | word, score | score }[0]
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
