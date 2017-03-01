module Scrabble

  class Player
    attr_reader :name, :plays

    def initialize(name)
      raise ArgumentError.new("name must be a string") if !name.is_a? String
      @name = name
      @plays = []
    end
  end
end
