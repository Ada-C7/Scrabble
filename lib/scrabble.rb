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
      word_array = word.split("")
      letter_value = 0

      word_score = word_array.map do | letter |
        SCORE_CHART.each do |letters, score|
          if letters.include?(letter.upcase)
            letter_value = score
          end
        end
        letter_value
      end
      (word_array.length == 7) ? word_score << 50 : word_score << 0
      return word_score.reduce(:+)
    end

    def self.highest_score_from_array(array_of_words)
      word_hash = Hash.new
      array_of_words.each do |word|
        word_score = Scoring.score(word)
        word_hash[word] = word_score
      end
      word = word_hash.max_by{|k, v| v }
      max_score = word[1]
      tie_winner = Scoring.tie(word_hash, max_score)
      return tie_winner.upcase
    end

    def self.tie(word_hash, max_score)
      tie_words = Array.new
      word_hash.each do |word, score|
        (tie_words << word) if score == max_score
      end
      tie_words.each do |word|
        return word if word.length == 7
      end
      return tie_words.min_by { |x| x.length}
    end

  end

end
