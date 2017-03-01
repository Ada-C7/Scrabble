module Scrabble
  class Scoring

    SCORE_CHART = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }

    def self.score(word)
      raise ArgumentError.new("input must be string") if word.class != String
      total = 0

      word.each_char do |letter|
        total += SCORE_CHART[letter.upcase]
      end
      total += 50 if word.length == 7
      return total
    end

    def self.highest_score_from(words)

      highest_score = words.map { |word| score(word) }.max
      highest_words = words.select {|word| score(word) == highest_score }

      return highest_words.first if highest_words.length == 1

      if highest_words.any? { |word| word.length == 7 }
        highest_words.select {|word| word.length == 7}.first
      else
        highest_words.min_by {|word| word.length}
      end

    end
  end
end
