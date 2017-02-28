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

    end #end of def

  end #end of class



end #end of module
