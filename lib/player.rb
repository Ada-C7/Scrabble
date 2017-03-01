module Scrabble

  class Player
    attr_reader :name, :plays, :won

    def initialize(name)
      @name = name
      @plays = []
      @won = false
    end


def play(word)
  if @won == false
    @plays << word
    # return
  else
    return false
  end
end

def won?
  @won ? true : false
end

  end
end
