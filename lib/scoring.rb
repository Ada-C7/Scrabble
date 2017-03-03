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

    attr_reader :letter_values, :highest_scores
    def initialize
      # might put something here in the future
    end

    def self.score(word)
      raise ArgumentError.new "Sorry, your word must by a String class type" if word.class != String

      raise ArgumentError.new "Your word must be less than or equal to 7 characters" if word.length > 7 || word.length == 0

      word_score = 0
      letters = word.upcase.split("")

      letters.each do |letter|
        raise ArgumentError.new if !letter.match(/^[A-Z]$/)

        LETTER_SCORES.each do |letter_score, letter_array|
          if letter_array.include?(letter)
            word_score += letter_score
          end
        end
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

      scores_hash = {}
      array_of_words.each do |word|
        scores_hash[word] = Scrabble::Scoring.score(word)
      end

      max_score = scores_hash.values.max

      @highest_scores = scores_hash.select {|word, score| score == max_score}

      word_lengths = @highest_scores.keys.map { |word| word.length }

      winner = ""

      #If only one highest score => winner
      if @highest_scores.length == 1
        winner = @highest_scores.keys.first
      else
        if word_lengths.max == 7
          winner = @highest_scores.keys.max { |word| word.length }
        else
          winner = @highest_scores.keys.min { |word| word.length }
        end
      end
    end
  end
end
