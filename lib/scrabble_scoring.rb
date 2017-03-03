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

    #do I need the total array to be initialized because I need it in all things

    def initialize

    def letters
      return LETTERS
    end

    def self.score(word)
      word = word.upcase
      total = []
      word.each_char do |letter|
        LETTERS.each do |key, array|
          if array.include?(letter)
            total << key
          end
        end
      end
      if word.length != 7
        return total.inject(:+)
      else
        return total.inject(:+) + 50
      end
    end

    def self.highest_score_from(array_of_words)
      highest = 0
      array_of_words.each do |word|
        # tile = word.length
        score = Scrabble::Scoring.score(word)
        highest = score if score > highest
        highest_word = word if score > highest

        # if score == highest
        #still need to figure out how to firgure out tiles as a qualifier
        print highest
        print highest_word
        return highest_word
      end

    end
    #something like word.length = tiles
  end
end

a = Scrabble::Scoring
a.highest_score_from(["no", "high", "hello"])
