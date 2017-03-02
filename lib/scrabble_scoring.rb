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
      raise ArgumentError.new("Enter a word") if word.class != String
      word = word.upcase
      total = []
      word.each_char do |letter|
        # print "Letter: #{letter}  \n"
        LETTERS.each do |key, array|
          # print "Key: #{key}  "
          # print "Array: #{array}\n"
          if array.include?(letter)
            # print array
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
      raise ArgumentError.new("Enter an array of words") if array_of_words.class != Array
      score = []
      array_of_words.each do |word|
        score << score(word)
      end
      word_score_hash = Hash[array_of_words.zip(score)]
      max_score_word = word_score_hash.select{|word, score| score == word_score_hash.values.max}

      if max_score_word != 1
        #if there are multiple words that tie, then choose the shortest word
        max_score_sorted = max_score_word.sort_by {|key, value| key.length}
          max_score_word.each do |word, score|
            if max_score_word.keys.length == 7
              return word
            else
              return max_score_sorted[0][0]
            end
          end
      end

    end


  end
end

# puts Scrabble::Scoring.score("purple")
# puts Scrabble::Scoring.highest_score_from(["black", "orange", "bijoux", "purple", "BANJAX", "quiz"])


# a = [5, 2, 3, 3, 5]
# b = ["E", "B", "C", "D", "A"]
# c = Hash[b.zip(a)]
# d = c.sort_by {|key, value| value}#don't need it
# e = c.values.max
# f = c.select{|key, value| value == c.values.max}
