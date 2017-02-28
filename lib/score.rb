
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
               winner = bucket.max_by {|key, value| value}[0]

          end


     end

end

array = %w(A seven letter word means that a player used all the tiles)

sample = Scrabble::Scoring

# puts sample.class
# puts sample
# puts sample.inspect
 # puts sample.score("cat")

puts sample.highest_score_from(array).inspect
