module Scrabble
  class Player
    attr_reader :name
    attr_accessor :plays
    def initialize(name)
      @name = name
      @plays = []
      raise ArgumentError.new("Name must be entered") if name == ""
    end
  end
end

# puts Scrabble::Player.new("test").class
