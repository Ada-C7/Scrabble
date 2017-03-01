module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays =[]
    end
  end
end
