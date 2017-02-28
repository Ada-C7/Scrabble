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
    # @@letters = LETTERS

    def self.score(word)
      word = word.upcase
      total = []
      word.each_char do |letter|
        # print "Letter: #{letter}  \n"
        LETTERS.each do |key, array|
          # print "Key: #{key}  "
          # print "Array: #{array}\n"
          if array.include?(letter)
            # print array
            total << key
          end
        end
      end
      if word.length != 7
        return total.inject(:+)
      else
        return total.inject(:+) + 50
      return total.inject(:+)
      end
    end

  end
end

# print  a = Scrabble::Scoring.new
# print a.letters.class
# print Scrabble::Scoring.score("YAY")
