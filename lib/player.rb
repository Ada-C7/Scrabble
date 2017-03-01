require_relative './scoring'

module Scrabble
    class Player < Scoring
        attr_reader :name, :plays, :total_score, :highest_word_score

        def initialize(name)
            @name = name
            @plays = []
            @word_scores = []
            @total_score = 0
            @highest_word_score = 0
      end

        def play(word)
            @plays << word
            if won?
                false
            else
                @word_scores << score(word)
                @total_score = @word_scores.reduce(:+)
            end
            @word_scores.last
            @highest_word_score = @word_scores.max
        end

        def highest_scoring_word
            highest_score_from(@plays)
        end

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        private

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
    end
end

# test = Scrabble::Player.new('Tamago')
#
# puts test.name
# puts test.play('word')
# puts test.play('cow')
# puts test.play('zizzl')
# puts test.play('qizzl')
# puts test.total_score
# puts test.highest_scoring_word
# puts test.highest_word_score
