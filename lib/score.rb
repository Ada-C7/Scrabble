
require_relative 'letter'
require 'awesome_print'

module Scrabble

     class Scoring

          def self.score(word)
               word = word.split("")
               word.map! {| letter | Letter.new(letter.upcase).point}
               score = word.inject { | sum, points | sum + points }
               score += 50 if word.length == 7
               score
          end

          def self.highest_score_from(words)
               scores = words.map {| word | score(word)} # calculate scores of words
               composite = words.zip(scores).to_h # combine scores and words
               composite = composite.group_by {| key, value | value } # group words by scores
               composite = composite.sort_by {| key, value | key} # sort words by scores
               winners = composite[-1].flatten.grep(String) # select winning word(s)
               winner = winners.min_by { | word | word.length} # tile tie-breaker
          end

          #      winner = 0
          #      puts bucket.inspect
          #     #  winning_words = []
          #      bucket.each do |key, value|
          #        if value > winner
          #          winner = value
          #        end
          #      end
          #
          #     #  bucket.each do |key, value|
          #     #    winning_words << key(winner)
          #     #  end
          #      #
          #     #  winning_words
          #
          #     winning_words = bucket.find_all { |key, value| value == winner }.to_h
          #     winning_names = winning_words.keys
          #     winning_names
          #
          #     if winning_names.length > 1
          #       shortest = ""
          #       winning_names.each do |word|
          #         if word.length == 7
          #           return word
          #         else
          #           return winning_names.min_by(&:length)
          #         end
          #       end
          #     end
     end

end

array = %w(A letter means that pliyer pleyer a used all the tiles)

puts sample = Scrabble::Scoring.highest_score_from(array)
