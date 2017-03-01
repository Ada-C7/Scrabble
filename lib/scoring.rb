module Scrabble
    class Scoring
        attr_accessor :word_score
        SCORE_CHART = {
            1 => %w(A E I O U L N R S T),
            2 => %w(D G),
            3 => %w(B C M P),
            4 => %w(F H V W Y),
            5 => %w(K),
            8 => %w(J X),
            10 => %w(Q Z)
        }.freeze

        def score(word)
            # starting word_score is based on word.length
            if word.length < 7 && !word.empty?
                @word_score = 0
            elsif word.length == 7
                @word_score = 50
            else
                raise ArgumentError, 'invalid word length'
            end

            word.each_char do |letter|
                @letter = letter.upcase
                SCORE_CHART.each do |number, array|
                    @word_score += number if array.include?(@letter)
                end
            end
            @word_score
        end

        def highest_score_from(array_of_words)
            @all_scores = []

            array_of_words.map { |word| @all_scores << score(word) }

            @scored_words = Hash[array_of_words.zip(@all_scores)]

            @high_words = @scored_words.find_all { |_word, score| @scored_words.values.max == score }

            @highest_word = @high_words.min_by do |word|
                if word[0].length == 7
                    @high_words.index
                else
                    word[0].length
                end
            end
            @highest_word = @highest_word[0]
            @highest_word
            end
        end
      end

# puts Scrabble::Scoring.score("squeeze")
# Scrabble::Scoring.highest_score_from(%w(words tofu fhiz whiz))
