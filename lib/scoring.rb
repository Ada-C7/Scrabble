module Scrabble

  class Scoring
    LETTERS_VALUES = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }

    def initialize

    end

    def self.score(word)
      word_array = word.upcase.split("")
      total = 0
      word_array.each do |letter|
        LETTERS_VALUES.each do |key, value|
          total += key if value.include? letter
        end
      end
      if word.length >= 7
        total += 50
      end
      return total
    end

    def self.highest_score_from(array_of_words)
      max = 0
      max_words = []
      array_of_words.each do |word|
        score_word = score(word)
        if score_word == max
          max_words.push word
        elsif score_word > max
          max = score_word
          max_words = [word]
        end
      end
      puts max_words
    end

  end # end of class
end # end of module
