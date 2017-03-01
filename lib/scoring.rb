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
      return turn_value
    end

    def self.highest_word(data)
      highest_word = [""]
      data.each do |word|
        raise ArgumentError.new("word must be a string!") if word.class != String
        if self.score(word) > self.score(highest_word[-1])
          highest_word = [word]
        elsif self.score(word) == self.score(highest_word[-1])
          highest_word << word
        end
      end
      return highest_word[0]
    end

  end
end
