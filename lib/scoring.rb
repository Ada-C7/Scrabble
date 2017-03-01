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
      letter_values = letters.map {|letter| score = SCORE_CHART[letter]}
      score = word.length < 7 ? letter_values.sum : letter_values.sum + 50
    end

    # Returns the word with the highest score.
    # If theres a tie, any seven letter words win,
    # otherwise the shortest word wins.
    def self.highest_score_from(array_of_words)
      # scores = words.group_by {|word| score(word)}
      # top_word(s) = scores.max[1] # [10, ["pink", "purple"]]
      # return top_word(s)[0] if top_word(s).length == 1
      # there's a tie
        #find the score of each word
      # return the word with the highest score if there is no tie
      # otherwise, return 1. 7 letter word 2. shortest word 3. first word

      max_score = 0
      best_word = ""
      array_of_words.each do |word|
        if score(word) > max
          max_score = score(word)
          best_word = word
        elsif score(word) == max #if tie, winner would be shorter word.
          if word.length < best_word.length
            best_word = word
          end
        end
      end
      return best_word
    end

    private

    # determine whether word contains only characters a-z
    def self.all_letters?(word)
      word[/[a-zA-Z]+/] == word
    end
  end
end

# letter = Scrabble::Scoring.new
# print letter.score_chart
