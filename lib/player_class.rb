module Scrabble

  class Player

    attr_reader :highest_scoring_word, :highest_word_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score ||= 0
    end

    def plays(word)
      word.score
      won?
      @plays << word

      # end

      def won?
        if total_score <= 100
          false
        else
          puts "Winner!"
        end

      end


    end#class end
  end #Mod end
