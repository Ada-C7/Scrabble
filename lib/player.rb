require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :total, :score, :all_scores, :playable_tiles

    def initialize(name)
      @name = name
      @plays = []
      @all_scores = []
    end

    def play(word)
      #adds input word into the plays Array returns 'false' if already won
      #returns score of word
      @plays << word

      @score = Scoring.score(word)
      @all_scores << @score

      if won?
        return false
      end
    end

    def total_score
      # Returns sum of score of played words
      # Calculates scores
      @total = @all_scores.inject(0) {|sum, num| sum + num}
      return @total
    end

    def won?
      total_score
      # If player score>100 return true
      # if score<100 return false
      if @total < 100
        return false
      else
        return true
      end
    end

    def highest_scoring_word
      #returns the highest playing scored word
      #returns word
      high_word = Scoring.highest_score_from(@plays)
      return high_word
    end

    def highest_word_score
      #returns the highest_scoring_word
      #returns score
      high_score = Scoring.score(Scoring.highest_score_from(@plays))
      return high_score
    end

    # The two following methods (part of Wave 3) were not completed and are not working at time of turning in assignment and have been commented out.

    #
    # def draw_tiles(tile_bag)
    #   @playable_tiles = []
    #   # tiles = TileBag.new
    #   @playable_tiles << tiles.draw_tiles(tile_bag)
    # end
    #
    # def tiles
    #   # a collection of letters that the player can play
    #   return @playable_tiles = []
    # end

  end
end
