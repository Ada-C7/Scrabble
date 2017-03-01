module Scrabble
  class Scoring
    LETTER_SCORES = {"a" => 1, "c" => 3, "b" => 3, "e" => 1, "d" => 2, "g" => 2,
             "f" => 4, "i" => 1, "h" => 4, "k" => 5, "j" => 8, "m" => 3,
             "l" => 1, "o" => 1, "n" => 1, "q" => 10, "p" => 3, "s" => 1,
             "r" => 1, "u" => 1, "t" => 1, "w" => 4, "v" => 4, "y" => 4,
             "x" => 8, "z" => 10}

    def self.tie_breaker(tie_words)
      tie_words.each do |word|
        if word.length == 7
          return word
        else
          # The & calls to_proc on the object
          # Returns a proc object that expects a parameter and calls a method
          # parameter is the tie_words and the method is :length
          return tie_words.min_by(&:length)
        end
      end
    end

    # think of better name
    def self.test_for_word_characters?(word)
       /\b[^\d\W]+\b/.match(word) == nil ? false : true
    end

    def self.score(word)
      # and add a condition for empty strings - or figure out a better regexs
      unless word.class == String && test_for_word_characters?(word)
        raise ArgumentError.new "Input word must be a string"
      end
      # The *  splat operator expands an Array into a list of arguments
      word_score = LETTER_SCORES.values_at(*word.downcase.chars).reduce(:+)
      word.length == 7 ? word_score += 50 : word_score
    end

    def self.highest_score_from(words)
      unless words.class == Array && words.length > 0 #&& words.each { |element| element.class == "string" }
        raise ArgumentError
      end
      scores_and_words = words.group_by { |word| score(word) }
      highest_words = scores_and_words.max_by { |score, word_list| score }
      highest_words[1].length > 1 ? tie_breaker(highest_words[1]) : highest_words[1].join
    end
  end
end

# print Scrabble::Scoring.highest_score_from(["cat", "dig", "123"])
# print Scrabble::Scoring.test_for_word_characters?("i")
# puts Scrabble::Scoring.score("hello")
# puts Scrabble::Scoring.score("123")
# puts Scrabble::Scoring.test_for_word_characters?("123")
