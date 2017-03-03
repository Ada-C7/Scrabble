module Scrabble
  class Scoring
    SCORE_CHART = {
      1 => [
        "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      ],
      2 => [
        "D", "G"
      ],
      3 => [
        "B", "C", "M", "P"
      ],
      4 => [
        "F", "H", "V", "W", "Y"
      ],
      5 => [
        "K"
      ],
      8 => [
        "J", "X"
      ],
      10 => [
        "Q", "Z"
      ]
    }

    def self.score(word)
      word = word.upcase
      puts "whaddup"
      @word_array = word.split("")
      @score_array = []
      if @word_array.length == 7
        @score_array << 50
      end

      @word_array.each do |letter|
        SCORE_CHART.each do |score, letter_array|
          letter_array.each do |score_letter|
            if score_letter == letter
              @score_array << score
              puts letter
            end
          end
        end
      end
      @score_array.inject(0) {|sum, num| sum + num}
    end

    def self.highest_score_from(array_of_words)
      # score_all_words = Scrabble::Scoring.score
      # iterate through array_of_words, applying score method to each word
      # hopefully return array of scores
      # match indexes to get highest scoring word

      #Beatiful .map method WORKS
      array_of_scores = array_of_words.map { |word| self.score(word) }
      #.zip method works. But an array within an array
      # all_2gether_now = array_of_words.zip(array_of_scores)
      #
      # all_2gether_now.max_by do | word_and_score |
      #   word_and_score[0]
      # end

      #Hash version of all_2gether_now -- SUCCESS
      hash_2gether = Hash[array_of_words.zip(array_of_scores)]
      # hash_2gether

      #NEED LOOP to find highest score (with all if conditions) and return word
      high_score_word = hash_2gether.max_by{|k,v| v}[0] #PASSES!

# The following is searching for a tie in the hash :D
      high_same_scoring_words = []
      hash_2gether.each do |word, score|
        if score == self.score(high_score_word)
          high_same_scoring_words << word

        end
      end

      # high_same_scoring_words.each do |word|
      #   word.length ... return lowest...
      # end
# move min_by deeper into the loop. Make it an each loop, if length is 7 it wins, elsif min_by to find shortest word and it wins
      # high_same_scoring_words.min_by do |word|
      #   word.length
      #   unless word.length == 7
      #   end
      # end

      # high_same_scoring_words.each do |word|
      #   word.length
      #   if word.length == 7
      #     word
      #   elsif high_same_scoring_words.min_by{|k| k.length}
      #     # high_same_scoring_words.min_by do |word|
      #     #   word.length
      #     # end
      #
      #   end
      #   return word
      # end
      seven_letter = high_same_scoring_words.select{|word| word.length == 7}

      if !seven_letter.empty?
        return seven_letter[0]
      else
        return high_same_scoring_words.min_by{|word| word.length}
      end


      # high_same_scoring_words.min_by{|k| k.length}
      # elsif word.length == 7
      #   high_same_scoring_words << word

      #which one is the shortest word.lenth?


      # hash_2gether.max_by{ |k,v|
      #
      #   if k.length == 7
      #     v + 50
      #   elsif
      #
      #   elsif condition
      #
      #   end
      #
      #
      #   }[0]

      #Maybe this can include the if conditions?
      # hash_2gether.max_by do |k,v|
      #   v
      #   if condition
      #     v
      #   end
      # end[0] #looks goofy, but it works.

    end


    # array_of_scores = []
    # array_of_words.each do |word|
    #   work_damnit = self.score(word)
    #   # work_damnit = word.length
    #   puts word
    #   array_of_scores << work_damnit
    # end
    # # return array_of_scores
    # end

  end
end
