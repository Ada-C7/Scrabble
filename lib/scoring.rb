module Scrabble

  class Scoring

    attr_reader :letter_values
    def initialize

    end

    def self.score(word)
      letter_scores = {
        1 => %w(A E I O U L N R S T),
        2 => %w(D G),
        3 => %w(B C M P),
        4 => %w(F H V W Y),
        5 => %w(K),
        8 => %w(J X),
        10 => %w(Q Z)
      }
      # puts letter_scores
      word_score = 0
      letters = word.upcase.split("")
      # puts "letters is #{letters}"
      letters.each do |letter|
        # puts "letter is #{letter}"
        letter_scores.each do |letter_score, letter_array|
          if letter_array.include?(letter)
            # puts "found #{letter}."
            word_score += letter_score
            # puts "adding #{letter_score} to total."
          end
        end
        # return word_score
      end
      word_score
      # letters.each do |letter|
      #
      # end
      # input: word (string)
      # output: score (integer)
      #
      # string has to be spliced into array of letters
      # reference a hash/array of values for each letter
      # loop through and add the letters' values
      # return total
    end

    def self.highest_score_from
    end

  end

end

puts Scrabble::Scoring.score("word")
