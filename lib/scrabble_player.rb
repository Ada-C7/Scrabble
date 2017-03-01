module Scrabble

  class Player
    attr_reader :name, :plays
    attr_accessor :score

    def initialize(name)
      raise ArgumentError.new("Name input must be a String") if name.class != String
      @name = name
      @plays = []
      @score = 0
    end

    #plays return array of words played by player
    # def plays
    #   return @plays
    # end

    #return true of player has > 100 points
    def won?
      return @score > 100 ? true : false
      #maybe score needs to be instance variable?
    end

    def play(word)
      raise ArgumentError.new("Word must be a string") if word.class != String

      if won?
        return false #Allows player to to play until win
      else
        @plays << word
      end
      return Scrabble::Scoring.score(word)
      #call METHOD won?
      #if won == true
      #return false
      #else, return score
      #call Scrabble:Scoring.score(word)
    end
  end

  #returns sum of score of played words
  def total_score
    #access @plays
    #LOOP/ITERATE through @plays
    #run each word in plays through
    #Scrabble:Scoring.score(word) METHOD
    #save the total somehow
    #return the total score
  end


  #returns the highest scoring played word
  def highest_scoring_word
    #access @plays
    #Run array @plays through METHOD
    #return Scrabble::Scoring.highest_score_from
  end

  #return the highest scoring word's
  #word score
  def highest_word_score
    #run highest_scoring_word METHOD
    #run that return through Scrabble:Scoring.score(word)
    #return as local variable.
  end

end
