module Scrabble

  class Player

    attr_reader :highest_scoring_word, :highest_word_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score ||= 0
    end

    def plays(word)
      word.score
      won?
      @plays << word
    end

    def draw_tiles(tile_bag)
    #WAVE 3 returns a collection of random tiles, removes the tiles from the default set
    end

    def tiles_remaining
    #WAVE 3 tiles_remaining returns the number of tiles remaining in the bag
    end

      def won?
        if @total_score <= 100
          false
        else
          raise ArgumentError.new puts "There is a clear winner! Great job, #{@name}!! Game over :("
        end
      end


      def highest_scoring_word(array_of_words)
        return Scoring::highest_score_from(array_of_words)
      end

      def highest_word_score(array_of_words)
        word = Scoring::highest_score_from(array_of_words)
        return Scoring::score(word)
      end


    end#class end
  end #Mod end

  #Modifications to `Player`
  #  Create specs for (__minimum 2__) and add to the `Player` class the following     instance methods:
  #
  #     - `#tiles` a collection of letters that the player can play (max 7)
  #     - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
