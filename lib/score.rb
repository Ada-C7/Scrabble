
require_relative 'letter'
require 'awesome_print'

module Scrabble

     class Scoring

          def self.score(word)
               if word.class != String || word[/[a-zA-Z]+/] != word || word.length > 7 || word.length < 2
                    raise ArgumentError.new("Word must be a string of letters between 2 and 7 characters long")
               end
              #  puts word.inspect
               word = word.split("")
              #  puts word.inspect
               word.map! {| letter | Letter.new(letter.upcase).point}
               score = word.inject { | sum, points | sum + points }
               score += 50 if word.length == 7
               score
          end

          def self.highest_score_from(words)
               raise ArgumentError.new if words ==  []
               scores = words.map {| word | score(word)} # calculate scores of words
               composite = words.zip(scores).to_h # combine scores and words
               composite = composite.group_by {| key, value | value } # group words by scores
               composite = composite.sort_by {| key, value | key} # sort words by scores
               winners = composite[-1].flatten.grep(String) # select winning word(s)
               winners.min_by { | word | word.length} # tile tie-breaker
          end

     end

end

# puts sample = Scrabble::Scoring.score("abcdef")
