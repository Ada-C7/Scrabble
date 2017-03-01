module Scrabble

  class Player
    attr_reader :name, :plays, :won

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @won = false
    end


def play(word)
  if @won == false
    @plays << word
    Scrabble::Scoring.score(word)
  else
    return false
  end
end



   #@plays.map {|word| @total_score += Scrabble::Scoring.score(word)}
def total_score
  @plays.each do |word|
    @total_score += Scrabble::Scoring.score(word)
  end
  @total_score
end



def won?
  @won ? true : false
end

  end
end
