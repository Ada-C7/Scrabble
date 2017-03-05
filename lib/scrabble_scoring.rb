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

    def self.highest_score_from(arry_of_words)
      raise ArgumentError.new("Enter an array of words") if arry_of_words.class != Array
      arry_of_scores = []

      arry_of_words.each do |word|
        arry_of_scores << self.score(word)
      end

      word_score_hash = Hash[arry_of_words.zip(arry_of_scores)]
      max_hash = word_score_hash.select{|word, score| score == word_score_hash.values.max}
      max_arry = max_hash.keys

      if max_arry.length != 1
        max_sorted =  max_arry.sort_by {|word| word.size}
        max_sorted.each do |word|
          if word.size == 7
            @winning_word = word
          else
            @winning_word = max_sorted[0]
          end
        end
        return @winning_word
      else
        return max_arry[0]
      end

    end


  end
end

# puts Scrabble::Scoring.score("purple")
# puts Scrabble::Scoring.highest_score_from(["black", "orange", "bijoux", "purple", "BANJAX", "quiz"])
# puts Scrabble::Scoring.highest_score_from(["banjax", "quiz", "blue", "qqqqqq",  "aaaaaaf" ])
# a = [5, 2, 3, 3, 5]
# b = ["E", "B", "C", "D", "A"]
# c = Hash[b.zip(a)]
# d = c.sort_by {|key, value| value}#don't need it
# e = c.values.max
# f = c.select{|key, value| value == c.values.max}
