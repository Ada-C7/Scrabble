module Scrabble

  class Scoring

    attr_reader :SCOREBOARD

    SCOREBOARD = {
      %w[a e i o u l n r s t]=>1, %w[d g]=> 2, %w[b c m p]=>3, %w[f h v w y]=> 4, %w[k]=> 5, %w[j x]=> 8, %w[q z]=> 10
    }

    def self.score word

      letter_values = []

      raise ArgumentError.new "Error. Please enter a string." if word.class != String

      raise ArgumentError.new "Error. Please enter a string of letters." if word.match(/^[[:alpha:]]+$/) == nil


      word_array = word.downcase.scan /\w/

      SCOREBOARD.each do |key, value|
        word_array.each do |letter|
          if key.include?(letter)
            letter_values << value
          else
            letter_values << 0
          end
        end
      end

      points_count = 0


      letter_values.each do |points|
        points_count += points
      end

      if word_array.size < 7
        return points_count
      else
        return points_count + 50
      end

    end

    def self.highest_score_from array

      score = []

      array.each do |word|
        score << Scoring.score(word)
      end

      winning_words = []
      losing_words = []

      array.each do |word|
        if score.max == Scoring.score(word)
          winning_words << word
        else
          losing_words << word
        end
      end

      if winning_words.length > 1
        if winning_words.any? { |word| word.length == 7 }
          return winning_words.find { |word| word.length == 7 }
        else
          return winning_words.min_by { |word| word.length}
        end

        #   return winning_words.min_by { |word| word.length}
        #   unless
        #     winning_words.any? { |word| word.length == 7 }
        #     return winning_words.find { |word| word.length == 7 }
        #   end
        # else
        #   return winning_words[0]
      end
      return winning_words[0]
    end



    # return array[score.each_with_index.max[1]]

  end

end






puts Scrabble::Scoring.score("aaaaaad")
puts Scrabble::Scoring.score("zzzzzx")
