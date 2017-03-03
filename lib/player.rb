module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      raise ArgumentError.new("Must enter a valid string.") if word.nil? || word.empty?
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def remove_tiles(letters)
      letters.each { |letter| @tiles.delete_at(@tiles.index(letter)) }
    end

    def total_score
      @plays.map { |word| Scoring.score(word) }.reduce(0, :+)
    end

    def won?
      total_score > 100
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      @tiles += tile_bag.draw_tiles(7 - @tiles.length)
    end

  end
end
