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
        hash_of_word_score = {}

        array_of_words.each do |word|
          hash_of_word_score[word] = self.score(word)
        end

        compare_score = hash_of_word_score.max_by{|k,v| v}

        array_of_highest_words = hash_of_word_score.map do | word , score |

          if score == compare_score[1]
            word
          end
        end.select { |value| value }

        #not a tie
        if array_of_highest_words.length == 1

          #highest_scoring_word = array_of_highest_words.max_by {|k,v| v}
          highest_scoring_word = array_of_highest_words.first.first

          return highest_scoring_word
          #instance of a tie #word lengths are the same
        elsif array_of_highest_words.first.length == array_of_highest_words.last.length

            highest_scoring_word = array_of_highest_words.first
            return highest_scoring_word

        else
          highest_scoring_word = array_of_highest_words.first

          array_of_highest_words.each do |word|
            if word.length < highest_scoring_word.length && word.length < 7
              highest_scoring_word = word
            else
              highest_scoring_word = array_of_highest_words.first
            end
          end
        end

        return highest_scoring_word
      end #end of method

  end #end of class
end #end of mod

array = ["Tweens", "Camp", "toy" ,"Key", "aeiourh", "Doloring"]
array2 = ["camp", "pamc", "toy", "love"]
puts Scrabble::Scoring::highest_score_from(array)
