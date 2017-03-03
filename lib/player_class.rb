module Scrabble

  class Player

    attr_reader :highest_scoring_word, :highest_word_score

    def initialize(name)
      @name = name
      @plays = []
      @tiles ||= tiles <= 7
      @draw_tiles = draw_tiles
      @total_score ||= 0
    end

    def plays(word)
      word.score
      won?
      @plays << word
    end

# fills tiles array until it has 7 letters from the given tile bag
    def draw_tiles(tile_bag)
        draw_tiles = 7 - @tiles
    end

      def won?
        if @total_score <= 100
          false
        else
          raise ArgumentError.new puts "...and the winner is... #{@name}!! Game over bye :("
        end
      end

      def highest_word_score(array_of_words)
        word = Scoring::highest_score_from(array_of_words)
        return Scoring::score(word)
      end

      def highest_scoring_word(array_of_words)
        return Scoring::highest_score_from(array_of_words)
      end


    end#class end
  end #Mod end

  #Modifications to `Player`
  #  Create specs for (__minimum 2__) and add to the `Player` class the following     instance methods:
  #
  #     - `#tiles` a collection of letters that the player can play (max 7)
  #     - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
