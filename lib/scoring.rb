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
      # Scores a word by splitting characters into an array and assigning point values to each letter then pushing to the score_array. Returns final score by adding all score numbers in score_array
      word = word.upcase
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
            end
          end
        end
      end
      @score_array.inject(0) {|sum, num| sum + num}
    end

    def self.highest_score_from(array_of_words)
      # Accepts array of words, scores them, creates hash with word as key and score as value. Returns word with highest score
      array_of_scores = array_of_words.map { |word| self.score(word) }
      hash_2gether = Hash[array_of_words.zip(array_of_scores)]

      high_score_word = hash_2gether.max_by{|word,score| score}[0]

      # The following is searching for and storing a tie in the hash :D
      high_same_scoring_words = []
      hash_2gether.each do |word, score|
        if score == self.score(high_score_word)
          high_same_scoring_words << word
        end
      end
      # This chooses 7 letter word as winner in case of a tie
      seven_letter = high_same_scoring_words.select{|word| word.length == 7}
      # This chooses shortest letter word as winner in case of a tie when no 7 letter words have been played
      if !seven_letter.empty?
        return seven_letter[0]
      else
        return high_same_scoring_words.min_by{|word| word.length}
      end
    end
  end
end
