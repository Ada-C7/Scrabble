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
      letter_array = []
      word = word.upcase
      raise ArgumentError.new ("Word must be uppercase") if word != word.upcase

      word.split('').map { |s| letter_array << s }

      letter_array.each do |letter|
        score += @letter_hash[letter]
      end
      if letter_array.length == 7
        score += 50
      end
      return score
    end

    def self.highest_score_from(array_of_words)
      score_array = []
      word_array = []

      array_of_words.each do |word|
        word_score = self.score(word)
        score_array << word_score
        word_array << word
      end

      zipper_test = word_array.zip(score_array)
      group_test = zipper_test.group_by { |word, value| [value] }

      @max = group_test.keys.max
      variable = group_test.select {|k, v| k == @max}

      group_test.select do |k, v| k == @max
        if v.count > 1
          # multiple_winning_words
          return v.count
        else
      variable.each do |key, array|
        highest_word = array[0][0]
        return highest_word
      end

      def multiple_winning_words
        puts "#{@max}"
      end

    end
  end

end
end
end
  array_of_words = ["apple","almond", "cat"]


  test_1 = Scrabble::Scoring.highest_score_from(array_of_words)

  puts test_1
