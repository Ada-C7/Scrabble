module Scrabble
  class Scoring
    LETTERS = {
              1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
              2 => ["D","G"],
              3 => ["B", "C", "M", "P"],
              4 => ["F","H","V","W","Y"],
              5 => ["K"],
              8 => ["J", "X"],
              10 => ["Q", "Z"]
            }
    def letters
      return LETTERS
    end
    #
    def self.score(word)
      word.length.times do |letter|
        self.letter.each do |key|
          self.letter.fetch(key).include?(letter)
        end
      end
    end

  end
end

a = Scrabble::Scoring.new
Scrabble::Scoring.score("yes")
