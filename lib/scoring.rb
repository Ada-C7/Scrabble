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
      hash_2gether.max_by{|k,v| v}[0] #PASSES!

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
