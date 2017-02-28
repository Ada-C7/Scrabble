module Scrabble

  class Scoring
    SCORE_CHART = {
      ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
      ["D", "G"] => 2,
      ["B", "C", "M", "P"] => 3,
      ["F", "H", "V", "W", "Y"] => 4,
      ["K"] => 5,
      ["J", "X"] => 8,
      ["Q", "Z"] => 10
    }


    def self.score(word)
      if word.length == 7
        score = 50
      else
        score = 0
      end
      word_array = word.split("")
      word_array.each do |letter|
        score += Scoring.letter_value(letter.upcase)
      end

      return score
    end


    def self.letter_value(letter)
      letter_value = 0
      SCORE_CHART.each do |array, value|
        if array.include?(letter)
          letter_value = value
          return letter_value
        end
      end
    end

    def self.highest_score_from_array(array_of_words)
      word_hash = Hash.new
      array_of_words.each do |word|
        word_score = Scoring.score(word)
        word_hash[word] = word_score
      end
        word = word_hash.max_by{|k, v| v}
        max_score = word[1]
        tie_winner = Scoring.tie(word_hash, max_score)
        return tie_winner.upcase
    end

    def self.tie(word_hash, max_score)
      tie_words = Array.new
      word_hash.each do |key, value|
        if value == max_score
          tie_words << key
        end
      end
      return tie_words.min_by { |x| x.length}
    end

  end

end
