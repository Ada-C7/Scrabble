module Scrabble

  class Scoring
    LETTER_SCORES = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }

    attr_reader :letter_values
    def initialize

    end

    def self.score(word)
      raise ArgumentError.new "Sorry, your word must by a String class type" if word.class != String

      raise ArgumentError.new "Sorry, your word contains a non-letter character" if !word.match?(/^[a-zA-Z]+$/)

      raise ArgumentError.new "Your word must be less than or equal to 7 characters" if word.length > 7 || word.length == 0

      # puts LETTER_SCORES
      word_score = 0
      letters = word.upcase.split("")
      # puts "letters is #{letters}"
      letters.each do |letter|
        # puts "letter is #{letter}"
        LETTER_SCORES.each do |letter_score, letter_array|
          if letter_array.include?(letter)
            # puts "found #{letter}."
            word_score += letter_score
            # puts "adding #{letter_score} to total."
          end
        end
        # return word_score
      end

      if word.length == 7
        word_score += 50
      end

      word_score

    end

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new "Must give an array!" if array_of_words.class != Array

      raise ArgumentError.new "Array can't be empty!" if array_of_words.empty?

      array_of_words.each do |word|
        raise ArgumentError.new "Your word must be a string!" if word.class != String
      end

      # INPUT: array of words (array)
      # output: word with highest score, handling ties (string)
      #
      # iterate over array_of_words and create a hash:
      #   key is word
      #   value is word_score, using self.score
      #
      # iterate over hash
      # find highest score
      # if there is > 1 word with highest score
      #   if there's a 7-letter word, it wins
      #   if there are more than one 7-letter words the first one wins
      #   else if there's no 7-letter words the shortest tie word wins
      #
      #

    end

  end

end

puts Scrabble::Scoring.score("word")
