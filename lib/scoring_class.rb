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
        array_of_scores = []

        array_of_words.each do |word|
          array_of_scores << self.score(word)
        end

        word_score_pair = array_of_words.zip(array_of_scores).to_h

        word_score_pair = word_score_pair.sort_by {|key, value| value} #returns array

        #new var
        array_of_highest_scores = word_score_pair.drop_while do |array|
          array[1] < word_score_pair[-1][1]
        end

        #not a tie
        if array_of_highest_scores.length == 1

          #highest_scoring_word = array_of_highest_scores.max_by {|k,v| v}
          highest_scoring_word = array_of_highest_scores[0][0]

          return highest_scoring_word
          #instance of a tie #word lengths are the same
        elsif array_of_highest_scores[0][0].length == array_of_highest_scores[-1][0].length

            highest_scoring_word = array_of_highest_scores[0][0]
            return highest_scoring_word

        else
          highest_scoring_word = array_of_highest_scores[0][0]

          array_of_highest_scores.each do |array|
            if array[0].length < highest_scoring_word.length && array[0].length < 7
              highest_scoring_word = array[0]
            else
              highest_scoring_word = array_of_highest_scores[0][0]
            end
          end
        end

        return highest_scoring_word
      end #end of method

  end #end of class
end #end of mod
