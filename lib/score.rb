module Scrabble
  class Scoring

    DICTIONARY = nil
    SCORE_CHART =
    ["A1", "B3", "C3", "D2", "E1", "F4", "G2", "H4", "I1", "J8", "K5", "L1", "M3", "N1", "O1", "P3", "Q10", "R1", "S1", "T1", "U1", "V4", "W4", "X8", "Y4", "Z10"]

    # def is_a_word?(word)
    #   # if the entered word is valid", " we enter the score. Otherwise", " we return 0
    # end

    def self.calculate_letter(letter)
      raise ArgumentError.new("We can only can only calculate points for a letter") if !(("A".."Z").include? letter.capitalize)

      SCORE_CHART[letter.capitalize.ord-65][1..-1].to_i


      # look up each letter from score chart", " get the total point value
      #if the word uses all the player's tiles. At the 8th tile", " the bonus will be given.
    end

    def self.score(word)
      word = word.split("")
      if word.length > 7
        score = 50
      else
        score = 0
      end

      score = word.reduce(score) {|val, letter| val + self.calculate_letter(letter)}


    end
    # else
    #   return 0

    def self.break_ties(word1, word2)

      if word1.length > word2.length
        return word2
      end
      return word1
    end

    def self.highest_score_from(array_of_words)
      #best_words = collections of highest scoring words pick the first one

      until false
        if array_of_words.length == 1
          return array_of_words.join
        end
        word1 = array_of_words[0]
        word2 = array_of_words[1]
        return break_ties(word1, word2)
      end
    end
  end
end
