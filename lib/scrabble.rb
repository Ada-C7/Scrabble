module Scrabble
  class Scoring

    def self.score(word)
      #check if the word is a string of letters. if it isn't raise an Argument error
      #iterate over the characters in the word and assign each letter a value from the score chart and add up the total
      #if the string is 7 characters add 50 points to the total
      #return total score

      word = word.downcase

      if word !~ /^[a-z]+$/
        raise ArgumentError.new "Please use only letters"
      end

      score_chart = {"a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4, "g" => 2, "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1, "m" => 3, "n" => 1, "o" => 1, "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4, "x" => 8, "y" => 4, "z" => 10}

      total = 0

      word.each_char do |letter|
        score_chart.each do |tile, value|
          if letter == tile
            total += value
          end #end of if
        end #end of do
      end #end of do

      if word.length == 7
        total += 50
      end

      return total

    end #end of score method

    def self.highest_score_from(array_of_words)
      scores = array_of_words.map { |word| Scoring.score(word) }

      words_and_scores = array_of_words.zip(scores).to_h

      #word with max score
      max_score = words_and_scores.values.max

      #hash of winning words + scores (all scores = max_score)
      word_with_max_score = words_and_scores.select { |k, v| v == max_score }

      #array of winning words
      winning_words = word_with_max_score.keys

      #length of shortest word in array of winning word
      min_word_length = (winning_words.min_by { |word| word.length }).length

      #tie-breaker conditionals
      if winning_words.length == 1 #only one winner
        return winning_words.join
      elsif winning_words.any? { |word| word.length == 7 }
        if winning_words.length == 1
          return winning_words.find { |word| word.length == 7 }
        else
          return array_of_words.find { |word| word.length == 7 && winning_words.include?(word) }
        end
      elsif (winning_words.select { |word| word.length == min_word_length}).length > 1 #more than one word of wining length
        return array_of_words.find { |word| word.length == min_word_length && winning_words.include?(word) }

      else #more than one winner, no 7-letters, only one of min length
        return winning_words.min_by { |word| word.length }
      end #end of tiebreaker if
    end #end of def highest_score_from

  end #end of class


end #end of module
