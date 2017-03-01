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

        raise ArgumentError.new("Only Letters A-Z") if word.class != String

        word_score = 0
        letter_points = []
        split_word = word.upcase.chars

        split_word.each do |letter|
          SCORE_CHART.each_pair do |num_key, array_of_letters|
            if array_of_letters.include? letter
              letter_points << num_key
            end
          end

          letter_points.each do |point|
            word_score += point
          end
        end

        if word.length >= 7
          word_score += 50
        end

        return word_score
      end #end of meth


      def self.highest_score_from(array_of_words)
        array_of_scores = []

        array_of_words.each do |word|
          array_of_scores << score(word)
        end

        word_score_pair = array_of_words.zip(array_of_scores).to_h
        puts "This is word_score_pair #{word_score_pair}"
        winner =  word_score_pair.max_by {|k,v| v}
        puts "this is the #{winner[0]}"
      end


  end #end of class
end #end of mod
