require_relative 'scrabble'

module Scrabble

  class Player
    attr_reader :name, :plays, :score_array, :score
    attr_accessor :tiles
    def initialize(name)
      raise ArgumentError.new "Player must have a valid name" if name.class != String
      @name = name
      @plays = []
      @score = 0
      @score_array = []
      @tiles = []
    end

    def play(word)
      raise ArgumentError.new "Word must be a valid word" if word.class != String


        @plays << word
        single_score(word.upcase)
        return ((won?) ? false : score)
      end


      def single_score(word)
        score = Scoring.score(word)
        score_array << score
        word.split("").each { |c| @tiles.delete(c) }
      end

      def total_score
        raise ArgumentError.new "No words have been played" if plays.length == 0
        return score_array.reduce(:+)
      end

      def won?
        raise ArgumentError.new "No words have been played" if plays.length == 0
        score = total_score
        return ((score >= 100) ? true : false)
      end

      def highest_scoring_word
        return Scoring.highest_score_from_array(plays)
      end

      def highest_word_score
        return score_array.max
      end

      def draw_tiles(tile_bag)
        if 7 - tiles.length > 0
          drawn = tile_bag.draw_tiles(7-tiles.length)
          drawn.each { |l| @tiles << l }
        end
      end

      

    end
  end
