module Scrabble
  class Scoring

    @letter_hash = {
      "A"=>1,
      "B"=>3,
      "C"=>3,
      "D"=>2,
      "E"=>1,
      "F"=>4,
      "G"=>2,
      "H"=>4,
      "I"=>1,
      "J"=>8,
      "K"=>5,
      "L"=>1,
      "M"=>3,
      "N"=>1,
      "O"=>1,
      "P"=>3,
      "Q"=>10,
      "R"=>1,
      "S"=>1,
      "T"=>1,
      "U"=>1,
      "V"=>4,
      "W"=>4,
      "X"=>8,
      "Y"=>4,
      "Z"=>10
    }


    def self.score(word)
      score = 0
      raise ArgumentError.new ("Word must be string") if word.is_a? Numeric
      word_array = []
      word = word.upcase
      raise ArgumentError.new ("Word must be uppercase") if word != word.upcase

      word.split('').map { |s| word_array << s }

      word_array.each do |letter|
        score += @letter_hash[letter]
      end
      if word_array.length == 7
        score += 50
      end
      return score
    end
  end

  def self.highest_score_from(array_of_words)
  end
end


puts Scrabble::Scoring.score("apple")
