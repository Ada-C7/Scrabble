module Scrabble
class Player
    attr_reader :name, :plays
    def initialize(name)
        @name = name
        @plays = []
    end

    def play(word)
        if word.class !=String
            raise ArgumentError.new("These are numbers")
        end

        word.each_char do |c|
            if c !~ /[a-z]/
                raise ArgumentError.new("Argument must contain only letters")
            end
        end
        @plays << word
    end







end
end
