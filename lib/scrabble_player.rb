module Scrabble

  class Player
    attr_reader :name, :plays, :tile_tray

    def initialize(name)
      raise ArgumentError.new("Name input must be a String") if name.class != String
      @name = name
      @plays = []
      @tile_tray = []
    end

    #return true of player has > 100 points
    def won?
      return total_score > 100 ? true : false
    end

    def play(word)
      raise ArgumentError.new("Word must be a string") if word.class != String
      if won?
        return false #Allows player to to play until win
      else
        @plays << word
      end
      word_score = Scrabble::Scoring.score(word)
      return word_score
    end

    def total_score
      score = 0
      @plays.each do |word|
        score += Scrabble::Scoring.score(word)
      end
      score
    end

    #returns the highest scoring played word
    def highest_scoring_word
      raise ArgumentError.new("Player must play a word") if @plays.empty?
      Scrabble::Scoring.highest_score_from(@plays)
    end

    #return the highest scoring word's
    #word score
    def highest_word_score
      raise ArgumentError.new("Player must play a word") if @plays.empty?
      highest_word = Scrabble::Scoring.highest_score_from(@plays)
      return Scrabble::Scoring.score(highest_word)
    end

    def player_bag
      @tile_bag ||= Scrabble::TileBag.new
    end

    def tiles #a collection of letters that the player can play -max 7
      return @tile_tray
    end

    def draw_tiles(tile_bag) #fills tiles array until it has 7 letters from tile bag

      @tile_tray << (player_bag.draw_tiles (7 - tiles))
    end
  end
end
