module Scrabble

  class Scoring
    SCORE_CHART = {'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
                   'N' => 1, 'R' => 1,  'S' => 1, 'T'=> 1,
                   'D' => 2, 'G' => 2,
                   'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
                   'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
                   'K' => 5,
                   'J' => 8, 'X' => 8,
                   'Q' => 10, 'Z' => 10 }

    # Returns the score for a given word.
    # Seven letter words get a 50+ bonus.
    def self.score(word)
      raise ArgumentError.new("word must be a string") if word.class != String
      raise ArgumentError.new("word must contain characters a-z") if !all_letters?(word)
      raise ArgumentError.new("word must be at most 7 letters") if word.length > 7

      letters = word.upcase.split("")
      letter_values = letters.map { |letter| SCORE_CHART[letter] }
      score = letter_values.sum
      word.length < 7 ? score : score + 50
    end

    # Returns the word with the highest score.
    # If theres a tie, any seven letter words win,
    # otherwise the shortest word wins.
    def self.highest_score_from(array_of_words)
      raise ArgumentError.new("argument must be an array") if !array_of_words.is_a? Array

      scores = array_of_words.group_by { |word| score(word) }
      top_words = scores.max.last # gives you the values associated with the max key
      top_words.sort_by! { |word| word.length }
      top_words.last.length == 7 ? top_words.last : top_words.first
    end

    private

      # determine whether word contains only characters a-z
    def self.all_letters?(word)
        word[/[a-zA-Z]+/] == word
    end
  end
end
