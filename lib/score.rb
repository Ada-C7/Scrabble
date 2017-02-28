module Scrabble
  class Scoring

    DICTIONARY = nil
    SCORE_CHART = nil

    def is_a_word?(word)
      # if the entered word is valid, we enter the score. Otherwise, we return 0
    end

    def calculating_score(word)
      word.split("")
      # look up each letter from score chart, get the total point value
      #if the word uses all the player's tiles. At the 8th tile, the bonus will be given.
    end

    def self.score(word)
      if is_a_word?(word)
        return score(word)
      else
        return 0
      end
    end

    def break_ties(word1, word2)
      if word1.length > word2.length
        return word2
      else
        return word1
      end
    end

    def self.highest_score_from(array_of_words)
      #best_words = collections of highest scoring words pick the first one
      if best_words.length > 1
        best_words == break_ties
      else
        return best_words.join(break_ties)
      end

    end

  end
end
