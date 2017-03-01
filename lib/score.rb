
require_relative 'letter'
require 'awesome_print'

module Scrabble

     class Scoring

          def self.score(word)

               word = word.split("")
               points = word.map {| letter | value = Letter.new(letter.downcase).point}
               tally = points.inject { | tally, points | tally + points }

          end

          def self.highest_score_from(array)

               comparison = array.map {| word | score(word)}
               bucket = array.zip(comparison).to_h
               #winner = bucket.max_by {|key, value| value}
              #  bucket.values.sort
               winner = 0
               puts bucket.inspect
              #  winning_words = []
               bucket.each do |key, value|
                 if value > winner
                   winner = value
                 end
               end

              #  bucket.each do |key, value|
              #    winning_words << key(winner)
              #  end
               #
              #  winning_words

              winning_words = bucket.find_all { |key, value| value == winner }.to_h
              winning_names = winning_words.keys
              winning_names

              if winning_names.length > 1
                shortest = ""
                winning_names.each do |word|
                  if word.length == 7
                    return word
                  else
                    return winning_names.min_by(&:length)
                  end
                end
              end




          end


     end

end

array = %w(A letter means that a used all the tiles)
# array = %w(cat echo tiles)
sample = Scrabble::Scoring

# puts sample.class
# puts sample
# puts sample.inspect
 # puts sample.score("cat")

puts sample.highest_score_from(array).inspect
