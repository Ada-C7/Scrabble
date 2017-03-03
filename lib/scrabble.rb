# require_relative '../lib/scrabble_player'

module Scrabble

  class Scoring

    attr_reader :SCOREBOARD

    # constant that is a hash of the point values of the letters
    SCOREBOARD = {
      %w[a e i o u l n r s t]=>1,
      %w[d g]=> 2, %w[b c m p]=>3,
      %w[f h v w y]=> 4,
      %w[k]=> 5,
      %w[j x]=> 8,
      %w[q z]=> 10
    }

    def self.score word

      letter_values = []

      raise ArgumentError.new "Error. Please enter a string." if word.class != String

      raise ArgumentError.new "Error. Please enter a string of letters." if word.match(/^[[:alpha:]]+$/) == nil

      word_array = word.downcase.scan /\w/ # regex that checks to make sure the string consists of only letters

      # this checks the value of our letters
      SCOREBOARD.each do |key, value|
        word_array.each do |letter|
          key.include?(letter) ? letter_values << value : letter_values << 0
        end
      end

      points_count = letter_values.inject { |points, n| points + n }

      word_array.size < 7 ? points_count : points_count + 50 # adds bonus points for 7 letter words
    end

    def self.highest_score_from array

      score = []

      score << (array.map { |word| Scoring.score(word) }).first # score for the entire word

      winning_words = []
      losing_words = []

      array.each do |word|
        score.max == Scoring.score(word) ? winning_words << word : losing_words << word
      end

      if winning_words.length > 1 ##
        winning_words.any? { |word| word.length == 7 } ? winning_words.find { |word| word.length == 7 } : winning_words.min_by { |word| word.length}
      end
      
      return winning_words[0]

    end
  end
end
