module Scrabble

  class Scoring
    SCOREBOARD = {
      %w[a e i o u l n r s t]=>1, %w[d g]=> 2, %w[b c m p]=>3, %w[f h v w y]=> 4, %w[k]=> 5, %w[j x]=> 8, %w[q z]=> 10
    }

    def self.score word
      letter_values = []

      word_array = word.scan /\w/

      word_array.each do |letter|
        SCOREBOARD.each do |key, value|
          if key.include?(letter)
            letter_values << value
          else
            letter_values << 0
          end

        end
        return word
      end
    end
  end


  puts Scoring.score(word)
