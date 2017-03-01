
require_relative 'letter'
require 'awesome_print'

module Scrabble

     class Scoring

          def self.score(word)
               if word.class != String || word.length > 7 || word.length < 2
                    raise ArgumentError.new("Word must be a string between 2 and 7 characters long")
               end
               puts word.inspect
               word = word.split("")
               puts word.inspect
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

     end


# puts sample.class
# puts sample
# puts sample.inspect
# puts sample.score("cat")
#
# array = %w(A letter means that pliyer pleyer a used all the tiles)
#
#
# puts sample = Scrabble::Scoring.highest_score_from(array)

end

#sample = Scrabble::Scoring.score("aaa")
