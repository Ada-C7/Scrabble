module Scrabble
    class Scoring
        attr_reader :word_score
        SCORE_CHART = {
            1 => %w(A E I O U L N R S T),
            2 => %w(D G),
            3 => %w(B C M P),
            4 => %w(F H V W Y),
            5 => ['K'],
            8 => %w(J X),
            10 => %w(Q Z)
        }.freeze

        def self.score(word)
            letter_score = 0
            @word_score = 0
            word.each_char do |letter|
                SCORE_CHART.each do |number, alpha|
                    letter_score = number if alpha.include?(letter.upcase)
                    @word_score += letter_score
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

puts Scrabble::Scoring.highest_score_from(%w(words tofu))
