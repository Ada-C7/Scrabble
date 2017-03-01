module Scrabble
  attr_accessor :word_score
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
          if score_array[score(word)].nil?
            score_array[score(word)] = [word]
          else
            score_array[score(word)] << word
          end
        end
        # Now need to look up max score, and then choose the word with the minimum length
        max_score = score_array.max_by {|score, word| score}[1]
        # return shortest_word(max_score)
        sorted_array = max_score.sort_by {|word| word.length}
        sorted_array.each do |word|
          # word.length == 7 ? word : nil
          if word.length == 7
            return word
          end
        end
        return sorted_array.first
      end

      # def self.shortest_word(word)
      #   s = word.each {|x| x.length }
      #   shortest_word = s.inject do |memo, s|
      #     if memo.length < s.length
      #       memo
      #     else
      #       s
      #     end
      #   end
      #   return shortest_word
      # end






    end
  end
