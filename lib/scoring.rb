module Scrabble
  class Scoring
    # SCORE_CHART = {"AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10}
    SCORE_CHART = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
    "E"=>1, "F"=>4, "G"=>2, "H"=>4,
    "I"=>1, "J"=>8, "K"=>5, "L"=>1,
    "M"=>3, "N"=>1, "O"=>1, "P"=>3,
    "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8,
    "Y"=>4, "Z"=>10}

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

      scores = {}
      words.each do |word|
        scores[word] = score(word)
      end

    highest_words = scores.select {|word, score| score == scores.values.max}

    if highest_words.length == 1
      return highest_words.keys[0]

    else
      bonus_words = highest_words.select {|word, score| word.length == 7}

      if bonus_words.length == 0

        return highest_words.keys.min_by {|word| word.length}
      else
        return bonus_words.keys[0]
      end

    end




    end


  end

end
#Scrabble::Scoring.score("apple")
