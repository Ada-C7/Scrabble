module Scrabble

  puts "Please enter your username (characters only): "
  name = gets.chomp.to_s

  class Player
    attr_accessor :words_played
    attr_reader :name

    def initialize(name)
      @name = name
      @words_played = []
      @score_tracker = []
    end

    def won?
      if @score_tracker.inject { |sum, n| sum + n } > 100
        puts "you won!"
        return true
      else
        return false
      end
    end


    def play(word)
      if @score_tracker.inject { |sum, n| sum + n } > 100
        puts "you can't play anymore because you won."
      else
        @score_tracker << Scrabble::Scoring.score(word)
        @words_played << word
        return Scrabble::Scoring.score(word)
      end

    end



  end

end



# test = Scrabble::Player.new(123)
