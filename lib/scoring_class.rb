module Scrabble

  class Scoring

    SCORE_CHART =
    {1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t" ],
      2 => ["d", "g" ],
      3 => ["b", "c", "m", "p" ],
      4 => ["f", "h", "v", "w", "y"],
      5 => ["k"],
      8 => ["j", "x"],
      10 => ["q","z"] }

      def initialize
      end

      def self.score(word)
        array_of_words = []
        word_score = 0
        letter_points = []
        array_of_words << word
        split_word = word.chars

        #puts split_word #test
        split_word.each do |letter|
          SCORE_CHART.each_pair do |num_key, array_of_letters|
            if array_of_letters.include? letter
              letter_points << key
            end
          end
          letter_points.each do |point|
            return word_score += point
          end
        end #end of meth

        def score_keeper
          array_of_words << word
          word_score_tally << word_score
          #hash of words:scores
          array_of_words.zip.to_h(:word, :score)

        end
      end


      def self.highest_score_from(array_of_words)
        #.length or max_by to find
        word_score_tally.max_by
        #longest word in array_of_words
        #return longest word

      end

    end #end of class
  end #end of mod
