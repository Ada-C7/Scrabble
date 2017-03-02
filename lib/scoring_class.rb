module Scrabble

  class Scoring

    SCORE_CHART =
    {1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
      2 => ["D", "G" ],
      3 => ["B", "C", "M", "P" ],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q","Z"] }


      def self.score(word)

        raise ArgumentError.new("Only Letters A-Z") if (/\d|\W/) === word

        word_score = 0
        letter_points = []
        split_word = word.upcase.chars


        split_word.each do |letter|
          SCORE_CHART.each_pair do |num_key, array_of_letters|
            if array_of_letters.include? letter
              letter_points << num_key
            end
          end
        end

        letter_points.each do |point|
          word_score += point
        end

        if word.length >= 7
          word_score += 50
        end

        return word_score

      end #end of meth


      def self.highest_score_from(array_of_words)
      #checks to make sure array has at least one word
        raise ArgumentError("You need play at least one word") if array_of_words.length :<, 1

        array_of_scores = []

#gives us an array of scores corresponding to the indexes in the array of words
        array_of_words.each do |word|
          array_of_scores << self.score(word)
        end

#creating a new array of "highest scores" , arranging the array of socres from smallest number to largest, and starting from the newly ordered array we're dropping all numbers that are less than the last number in the array, any numbers matching the last number are stored in the array of highest scores.
        array_of_highest_scores = array_of_scores.sort.drop_while do |score|
          score < array_of_scores[-1]
        end

#checking if the array of scores is equal to 1, and if it is, it goes through the zip process and returns the highest scoring word.
        if array_of_highest_scores.length == 1

          word_score_pair = array_of_words.zip(array_of_scores).to_h

          highest_scoring_word =  word_score_pair.max_by {|k,v| v}
          puts "#{highest_scoring_word[0]} is the highest scoring word}"

          return highest_scoring_word

        else
#if the array of scores does not equal 1 , this means we have a score tie and need more conditionals.
          return array_of_highest_scores
        end
      end #end of method


  end #end of class
end #end of mod
