require_relative 'scoring'
#require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :plays, :total, :score, :all_scores

    def initialize(name)
      @name = name
      @plays = []
      @all_scores = []
    end

    def play(word)
      #adds input word into the plays Array returns 'false' if already wond
      #returns score of word
      @plays << word
      #plays << word

      ##play(word) NEEDS TO RETURN THE SCORE OF word
      ##WAS CALCULATING indiv scores and total in total_score
      @score = Scoring.score(word)
      @all_scores << @score
      #.zip @plays and @scores so the word is the symbol key?
      #if zipped, @plays and @scores still live independently
      #that seems convenient, basically it be an additional 3rd

      if won?
        return false
      end
    end

    # def plays #may not need method may use instance variable instead
    #   #returns an Array of the words played by the player
    #
    # end

    def total_score
      #returns sum of score of played words
      #need to calculate scores
      #we have an existing scoring method in Scoring class
      #believe we should call scoring method from scoring class
      # score = @plays.map { |word| Scoring.score(word) }
      # @total = score.inject(0) {|sum, num| sum + num}
      # return @total

      #BASED ON CHANGed addition of scores instance variable
      @total = @all_scores.inject(0) {|sum, num| sum + num}
      return @total
    end

    def won?
      total_score
      #if player score>100 return true if score<100 return false
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

=begin

  def tiles

  end


  def draw_tiles(tile_bag)

  end

=end


  end
end
