require_relative "./scoring.rb"

module Scrabble
  class Player
    attr_reader :name, :plays, :players_tiles

    def initialize(name)
        @name = name
        @plays = []
        @scores = []
        @players_tiles = []
        
    end

    def play(word)
        if word.class !=String
            raise ArgumentError.new("The argument must be a string.")
        end

        word.each_char do |c|
          if c !~ /[a-z]/
              raise ArgumentError.new("Argument must contain only letters")
          end
        end

        if won? == true
            puts "You've already won!"
        else
            @plays << word
            @scores << Scoring.score(word)
            return @scores[-1]
        end

    end

    def draw_tiles(tilebag)
        num = 7 - @players_tiles.length
        new_tiles = tilebag.draw_tiles(num)
        new_tiles.each do |tile|
          @players_tiles << tile
        end

    end

    def total_score
      total = 0

      @scores.each do |score|
          total +=score
      end
    #   total = @scores.reduce(:+)
    #   total = @scores.inject { |total,score| total + score }

      return total
    end


    def won?
        if total_score < 101
            return false
        else
            return true
        end
    end


    def highest_scoring_word
      Scoring.highest_score(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

  end
end
