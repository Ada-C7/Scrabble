require_relative './scoring'

module Scrabble
    class Player < Scoring
        attr_accessor :word_scores
        attr_reader :name, :plays, :total_score, :highest_word_score

        def initialize(name)
            @name = name
            @plays = []
            @word_scores = []
            @total_score = 0
            @tiles = [] # a collection of 7 letters
        end

        def play(word)
            raise ArgumentError, 'Invalid input for word' unless word =~ /^[a-z]+$/i
            @plays << word
            if won?
                return false
            else
                @word_scores << score(word)
                @highest_word_score = @word_scores.max
                @total_score = @word_scores.reduce(:+)
                return @word_scores.last
              end
        end

        def highest_scoring_word
            highest_score_from(@plays)
        end

        def won?
            if @total_score >= 100
                true
            else
                false
            end
        end

        def highest_score_from(array_of_words)
            super(array_of_words)
        end

        def score(word)
            super(word)
        end

        def draw_tiles(tile_bag)


        end
    end
end

# test = Scrabble::Player.new('Tamago')
# test.name
# test.play('word')
# test.play('cow')
# test.play('zizzl')
# test.play('qizzl')
# # puts test.total_score
# # puts test.highest_scoring_word
# puts test.highest_word_score
# puts test.word_scores.max
