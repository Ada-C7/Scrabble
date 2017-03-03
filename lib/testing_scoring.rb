# # module Scrabble
# #   attr_reader :word_score
# #   class Scoring
# #     SCORE = {
# #       1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
# #       2 => ["D", "G"],
# #       3 =>["B", "C", "M", "P"],
# #       4 =>["F", "H", "V", "W", "Y"],
# #       5 => ["K"],
# #       8 => ["J", "X"],
# #       10 => ["Q", "Z"]}
# #
# #
# #
# #       def each(&block)
# #
# #       end
# #
# #       def self.score(word)
# #         @word_score = 0
# #         if word.length == 7
# #           @word_score += 50
# #         end
# #         word.each_char do |letter|
# #           @letter = letter.upcase
# #           SCORE.each do |score, letter|
# #             if letter.include? @letter
# #               @word_score += score
# #             end
# #           end
# #         end
# #         return @word_score
# #       end
# #
# #       def self.highest_score_from(array_of_words)
# #         score_array = {}
# #         array_of_words.each do |word|
# #           if score_array[score(word)].nil?
# #             score_array[score(word)] = word
# #           else
# #             score_array[score(word)] << word
# #           end
# #         end
#
#
# array_of_words  = [ "hair" , "bat" , "seattle" , "dfgh", "dfgssdfgsh", ]
#
# def tiebreaking(words)
#   # tiebreaking : if same score, winner = 7 letter one > fewer tiles
#   # tiebreaking : if same score, winner == shortest length
#
#   string_lengths = words.each { |x| p x.length }
#
#
# return  string_lengths.select { |key, value| value == 7 }
#
#
#   # else
#   #   s = words.each {|x| x.length }
#   #   shortest_word = s.inject do |memo, s|
#   #     if memo.length < s.length
#   #       memols
#   #     else
#   #       s
#   #     end
#   #   end
#   #   returnclear shortest_word
# end
#
#
#
#
# tiebreaking(places)
#
# overall_winner = score_array.max_by {|score, words| score}[1]
#
#
#
#
#
#
#
#
#
# # def self.score_tie_breaker(array_of_words)
# #   word_length = array_of_words.each {|x| x.length }
# #   winner = word_length.select { |x| x.length == 7  }
# #   return winner
# # end
#
# # def self.shortest_word(array_of_words)
# #   s = array_of_words.each {|x| x.length }
# #   shortest_word = s.inject do |memo, s|
# #     if memo.length < s.length
# #       memo
# #     else
# #       s
# #     end
# #   end
# #   return shortest_word
