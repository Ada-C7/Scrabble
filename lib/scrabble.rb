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
######ZIPPERthis was going to go below
      zipper_test = word_array.zip(score_array)
      highest_score = zipper_test.max_by {|x| x[1]}[1]
      words_with_highest_score = zipper_test.select{|x| x[1] == highest_score}
      max_string = words_with_highest_score.max_by {|x| x[0].length}[0].length
      first_word = words_with_highest_score.select {|x| x[0].length == max_string}
######this ends


      group_test = zipper_test.group_by { |word, value| [value] }

      @max = group_test.keys.max
      group_test.select do |k, v| k == @max
        variable = group_test.select {|k, v| k == @max}
        if v.count > 1
          variable.each_pair do |k, words|
            words.each do |word|
              if word[0].length == 7
                x = word[0]
                return x
              end
            end
            #insert if else here to account for words with same score and length, we have this above between some comments. We were going to enter the code between the ZIPPER comments with a conditional for if there were multiple words with the same score and length but with lengths less than 7
            return words.min_by {|x| x[0].length}[0]
          end
          # return v.count
        else
          return variable[@max][0][0] #returning out non-tie word
        end
      end
    end

  end
end
# array_of_words = ["aaaaaaf", "zzzzzz", "cat"] #array for if you have 2 words with the same score but one witha  length of 7 and one with less than 7
array_of_words = ["almood","almond", "apple", "cat"]

test_1 = Scrabble::Scoring.highest_score_from(array_of_words)

# puts test_1
