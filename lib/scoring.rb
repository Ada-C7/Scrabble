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
      raise ArgumentError.new("Argument must be an array") if word.class != String
      word_array = word.upcase.split("")
      total = 0
      word_array.each do |letter|
        LETTERS_VALUES.each do |key, value|
          total += key if value.include? letter
        end
      end
      if word.length == 7
        total += 50
      end
      return total
    end

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("Argument must be an array") if array_of_words.class != Array
      array_of_words.each do |word|
        if word.class != String
          raise ArgumentError.new("Elements in array must be strings")
        end
      end

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

      if max_words.length > 1
        return tie(max_words)
      else
        return max_words[0]
      end
    end

    def self.tie(max_words)
      max_word = max_words.select{|word| word.length == 7}
        if !max_word.empty?
          return max_word[0]
        else
          max_word = max_words.min_by {|i| i.length}
          return max_word
        end
    end





  end # end of class
end # end of module

array_of_words = ["dddddx", "kkdddd"]
puts Scrabble::Scoring.score("quizzes")
puts Scrabble::Scoring.score("Qqqqqqqqf")
puts Scrabble::Scoring.highest_score_from(array_of_words).class
