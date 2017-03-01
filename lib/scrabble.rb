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

      max_score = words_and_scores.values.max

      word_with_max_score = words_and_scores.select { |k, v| v == max_score }

      if word_with_max_score.length == 1 #only one winner
        return word_with_max_score.keys.join
      elsif word_with_max_score.keys.any? { |word| word.length == 7 }
        poss_words = array_of_words.select { |word| word_with_max_score.keys.length == 7}
        return poss_words[0]
        # return (word_with_max_score.keys.select { |word| word.length == 7 }).join
      elsif
        return word_with_max_score.keys.min_by { |word| word.length }
      else # word_with_score.keys.length <- lengths are the same
        poss_words = array_of_words.select { |word| word_with_max_score.keys.include? }
        return poss_words[0]
      end

      # Order for tiebreaker conditionals.
      # if only one winner
      #     pick that winner
      # elsif (more than one winner)...there is a winner with 7 letters?
      #     if just one...that's the winner.
      #     else...pick the one that's first in the array
      # elsif (more than one winner, no 7-letter words)...there is more than one winner that ties for shortest length word
      #     pick the one that is first in the array
      # else (more than word, no 7-letter words, not more than one of shortest length)
      #     pick the shortest word

    end

  end #end of class



end #end of module
