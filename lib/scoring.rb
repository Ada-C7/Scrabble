module Scrabble
  class Scoring
    SCORE_CHART = {
      1 => [
        "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      ],
      2 => [
        "D", "G"
      ],
      3 => [
        "B", "C", "M", "P"
      ],
      4 => [
        "F", "H", "V", "W", "Y"
      ],
      5 => [
        "K"
      ],
      8 => [
        "J", "X"
      ],
      10 => [
        "Q", "Z"
      ]
    }

    def self.score(word)
      word = word.upcase
      puts "whaddup"
      @word_array = word.split("")
      @score_array = []
      if @word_array.length == 7
        @score_array << 50
      end

      @word_array.each do |letter|
        SCORE_CHART.each do |score, letter_array|
          letter_array.each do |score_letter|
            if score_letter == letter
              @score_array << score
              puts letter
            end
          end
        end
      end
      @score_array.inject(0) {|sum, num| sum + num}
    end

    def self.highest_score_from(array_of_words)
      
    end

  end
end
