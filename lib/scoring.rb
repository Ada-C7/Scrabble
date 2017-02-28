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
            @high_words = []
            @highest_word = ''
            @highest_score = 0
            @word_length = 0
            array_of_words.each do |word|
                @all_scores << score(word)
            end
            @scored_words = Hash[array_of_words.zip(@all_scores)]

            @scored_words.each do |word, score|
                @high_words << word if score == @scored_words.values.max
            end

            if @high_words.length > 1
                @high_words.each do |word|
                    if (word.length < @word_length || word.length == 7 || @word_length == 0) && @word_length < 7
                        @word_length = word.length
                        @highest_word = word
                    end
                end
            else
                @highest_word = @high_words.pop
            end

            @highest_word
            end
        end
      end

      all_scores = array_or_words.map {|word| score(word)}
      scored_words = Hash[array_of_words.zip(@all_scores)]
      scored_words.select {|k,v| k if v == all_scores.max}
      return hash.values[0]







# puts Scrabble::Scoring.score("squeeze")
Scrabble::Scoring.highest_score_from(%w(words tofu fhizaa whizaa))
