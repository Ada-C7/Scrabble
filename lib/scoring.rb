module Scrabble
  attr_reader :word_score
  class Scoring
    SCORE = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 =>["B", "C", "M", "P"],
      4 =>["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]}

      def self.score(word)
        @word_score = 0
        if word.length == 7
          @word_score += 50
        end
        word.each_char do |letter|
          @letter = letter.upcase
          SCORE.each do |score, letter|
            if letter.include? @letter
              @word_score += score
            end
          end
        end
        return @word_score
      end

      def self.highest_score_from(array_of_words)
        score_array = {}
        array_of_words.each do |word|
          score_array[word] = score(word)
        end
        # return max_score = score_array[1].max
        return score_array.max_by {|word, score| score}[0]
      end
    end
  end
