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
      print total.inject(:+)
    end

  end
end

# # a = Scrabble::Scoring.new
# print Scrabble::Scoring.score("BIRD")
