module Scrabble
  class Scoring

    SCORES = {1 => %w(A E I O U L N R S T), 2 => %w( D G), 3 => %w(B C M P), 4 => %w(F H V W Y), 5 => ["K"], 8=> %w(J X) , 10 => %w(Q Z)}

    def self.score(string)
      string.upcase!
      turn_value = 0
      string.each_char do |letter|
        SCORES.each do |point, value|
          if value.include?(letter)
            turn_value += point
          end
        end
      end
      if string.length == 7
        turn_value += 50
      end
      return turn_value
    end

    def self.highest_word(data)
      highest_word = [""]
      data.each do |word|
        if self.score(word) > self.score(highest_word[0])
          highest_word = [word]
        elsif self.score(word) == self.score(highest_word[-1])
          highest_word << word
        end
      end
      if highest_word[1] != nil
        highest_word = self.tiebreaker(highest_word)
      end
      return highest_word[0]
    end

    def self.tiebreaker(array)
      winner = ""
      array.each_with_index do |word, index|
        if word.length == 7
         return winner = [word]
       elsif word.length < array[index - 1].length
            winner = word
        else
            winner = array[0]
        end
      end
      return [winner]
    end

  end
end

puts Scrabble::Scoring.score("GGGGGG")
puts Scrabble::Scoring.score("IIIIIII")
puts Scrabble::Scoring.highest_word(%w(GGGGGG IIIIIII))
