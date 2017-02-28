module Scrabble
    class Scoring
        attr_reader :word_score
        SCORE_CHART = {
            1 => %w(A E I O U L N R S T),
            2 => %w(D G),
            3 => %w(B C M P),
            4 => %w(F H V W Y),
            5 => %w(K),
            8 => %w(J X),
            10 => %w(Q Z)
        }.freeze

        def self.score(word)
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

        def self.highest_score_from(array_of_words)
            @all_scores = []
            @highest_word = ''
            @highest_score = 0
            array_of_words.each do |word|
                @all_scores << score(word)
            end
            @scored_words = Hash[@all_scores.zip(array_of_words.zip)]
            @scored_words.each do |score, word|
                if score > @highest_score
                    @highest_word = word
                    @highest_score = score
                elsif score = @highest_score
                    if word.length > @highest_word.length
                        @highest_word = word
                        @highest_score = score
                        unless @highest_word.length == 7
                        end
                    end
                end
            end
            @highest_word
        end
    end
end

# puts Scrabble::Scoring.score("squeeze")
# puts Scrabble::Scoring.highest_score_from(%w(words tofu))
