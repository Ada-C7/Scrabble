module Scrabble

  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      raise ArgumentError.new("Name input must be a String") if name.class != String
      @name = name
      @plays = []
      @total_score = 0
    end

    #plays return array of words played by player
    # def plays
    #   return @plays
    # end

    #return true of player has > 100 points
    def won?
      return @total_score > 100 ? true : false
      #maybe score needs to be instance variable?
    end

    def play(word)
      raise ArgumentError.new("Word must be a string") if word.class != String
      if won?
        return false #Allows player to to play until win
      else
        @plays << word
      end
      word_score = Scrabble::Scoring.score(word)
      @total_score += word_score
      return word_score
    end


    # def total_score
    #   score = 0
    #   @plays.each do |word|
    #     score += Scrabble::Scoring.score(word)
    #   end
    #   score
    # end


    #returns the highest scoring played word
    def highest_scoring_word
      #access @plays
      Scrabble::Scoring.highest_score_from(@plays)
    end

    #return the highest scoring word's
    #word score
    def highest_word_score
      #run highest_scoring_word METHOD
      highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return Scrabble::Scoring.score(highest_word)

      #run that return through Scrabble:Scoring.score(word)
      #return as local variable.
    end
  end
end
