module Scrabble
  class Scoring
    # LETTER_SCORES = { a: 1, c: 3, b: 3, e: 1, d: 2, g: 2, f: 4, i: 1, h: 4, k: 5, j: 8,
    #                 m: 3, l: 1, o: 1, n: 1, q: 10, p: 3, s: 1, r: 1, u: 1, t: 1, w: 4,
    #                 v: 4, y: 4, x: 8, z: 10 }
    LETTER_SCORES = {"a" => 1, "c" => 3, "b" => 3, "e" => 1, "d" => 2, "g" => 2,
             "f" => 4, "i" => 1, "h" => 4, "k" => 5, "j" => 8, "m" => 3,
             "l" => 1, "o" => 1, "n" => 1, "q" => 10, "p" => 3, "s" => 1,
             "r" => 1, "u" => 1, "t" => 1, "w" => 4, "v" => 4, "y" => 4,
             "x" => 8, "z" => 10}

    # attr_reader :letter_scores
    #
    # # refractor this to a constant - go back to strings?
    # def initialize
    #
    # end

    def self.tie_breaker(tie_words)
      tie_words.each do |word|
        if word.length == 7
          return word
        else
          return tie_words.min_by(&:length)
        end
      end
      #  unless tie_words.select { |word| word.length == 7 }
    end

    def self.score(word)
      unless word.class == String
        raise ArgumentError.new "Input word must be a string"
      end
      # Not sure how the asterisk works -- inspired from Stack Overflow
      word_score = LETTER_SCORES.values_at(*word.chars).reduce(:+)
      word.length == 7 ? word_score += 50 : word_score
    end

    def self.highest_score_from(words)
      raise ArgumentError if words.class != Array
      # will return a hash where key is the score and value is array of the word(s)
      # with that score
      scores_and_words = words.group_by { |word| score(word) }
      # now we need to get the word we want out of the scores hash
      # we want to return the value of the higest key
      # this returns an array with the score at idex zero and word list at index 1
      highest_words = scores_and_words.max_by { |score, word_list| score }
      highest_words[1].length > 1 ? tie_breaker(highest_words[1]) : highest_words[1].join
    end
  end
end

# print Scrabble::Scoring.highest_score_from(["ox", "meow", "cat", "ax"])
# puts
# print Scrabble::Scoring.highest_score_from( ["algebra", "qzqzqz"])
# puts
