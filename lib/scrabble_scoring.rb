module Scrabble

  class Scoring

    LETTERS = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D","G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F","H","V","W","Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    def letters
      return LETTERS
    end

    def self.score(word)
      word = word.upcase
      total = []
      word.each_char do |letter|
        LETTERS.each do |key, array|
          if array.include?(letter)
            total << key
          end
        end
      end
      if word.length != 7
        return total.inject(:+)
      else
        return total.inject(:+) + 50
      end
    end

    def self.highest_score_from(array_of_words)
      score = []
      array_of_words.each do |word|
        score << Scrabble::Scoring.score(word)
      end
      word_score_hash = Hash[array_of_words.zip(score)]
      max_score = word_score_hash.select{|word, score| score == word_score_hash.values.max}

      if max_score != 1
        #if there are multiple words that tie, then choose the shortest word
        max_score_sorted = max_score.sort_by {|key, value| key.length}
        max_score.each do |word, score|
          if max_score.keys.length == 7
            return word
          else
            return max_score_sorted[0][0]
          end
        end
      end


      # highest = 0
      # array_of_words.each do |word|
      #   score = Scrabble::Scoring.score(word)
      #   highest = score if score > highest
      #   highest_word = word if word == score
      #   # highest_word = word if word.score = highest
      #   print highest
      #   # print highest_word
      #   # print highest_word
      #   # return highest_word
    end
  end
end
