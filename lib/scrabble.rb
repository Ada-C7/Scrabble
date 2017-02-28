module Scrabble

  class Scoring

    attr_reader :SCOREBOARD

    SCOREBOARD = {
      %w[a e i o u l n r s t]=>1, %w[d g]=> 2, %w[b c m p]=>3, %w[f h v w y]=> 4, %w[k]=> 5, %w[j x]=> 8, %w[q z]=> 10
    }

    def self.score word

      letter_values = []

      raise ArgumentError.new "Error. Please enter a string." if
      word.class != String

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


      # word_array.each do |letter|
      #   SCOREBOARD.each do |key, value|
      #     if key.include?(letter)
      #       letter_values << value
      #     else
      #       letter_values << 0
      #     end
      #   end

      # this needs to go into the next black
      points_count = 0
      # puts letter_values
      # puts word_array

      letter_values.each do |points|
        points_count += points
      end

      if word_array.size < 7
        return points_count
      else
        return points_count + 50
      end

    end
  end
end


puts Scrabble::Scoring.score("ooooooooo")
