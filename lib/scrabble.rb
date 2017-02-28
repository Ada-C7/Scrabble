module Scrabble
  class Scoring
    # Class constant stores the letters and their repective scores
    # SCORE_CHART = {
    #   1 => %w(A E I O U L N R S T),
    #   2 => %W(D G),
    #   3 => %W(B C M P),
    #   4 => %W(F H V W Y),
    #   5 => %W(K),
    #   8 => %W(J X),
    #   10 => %W(Q Z),
    # }
    SCORE_CHART = {"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1,
      "F"=>4, "G"=>2, "H"=>4,"I"=>1, "J"=>8,
      "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1,
      "P"=>3,"Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}

      # Calculates and returns the total score for the given word
      def self.score(word)
        raise ArgumentError.new("Invalid data type entered for word") if word.class != String
        raise ArgumentError.new("Invalid word length: word length <= 7") if word.length > 7

        word_score = 0
        letters = word.upcase.split("")
        letters.each do |letter|
          word_score += SCORE_CHART[letter] 
        end
        word_score += 50 if word.length == 7
        return word_score
      end



      def self.highest_score_from(array_of_words)
        score_length_pair = []
        # strings.maxby{|string| string.length}
      end
    end
  end
