require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


describe Scrabble::Scoring do

     array = %w(Returns a hash where the keys are the evaluated result from the block and the values are arrays of elements in the collection that correspond to the key)

     #describe self.score(word) do



     #end


     describe self.highest_score_from(words) do


     #describe self.highest_score_from(words) do


     #end

end
