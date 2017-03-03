module Scrabble
  class Scoring
    attr_accessor :word_score
    SCORE_CHART = {
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
          SCORE_CHART.each do |score, tile|
            if tile.include? @letter
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
        max_score = score_array.max_by {|score, word| score}[1]
        sorted_array = max_score.sort_by {|word| word.length}
        sorted_array.each do |word|
          if word.length == 7
            return word
          end
        end
        return sorted_array.first
      end
  end
end
