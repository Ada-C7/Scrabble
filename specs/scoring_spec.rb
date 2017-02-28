require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe Scrabble::Scoring do
    describe 'self.score(word)' do
        it 'Returns an integer' do
            Scrabble::Scoring.score('word').must_be_instance_of Integer
        end

        it 'Returns the correct score' do
            Scrabble::Scoring.score('word').must_equal 8
        end

        it 'Argument is case insensitive' do
            Scrabble::Scoring.score('wOrD').must_equal 8
        end

        it 'A seven letter word results in 50 point bonus' do
            Scrabble::Scoring.score('zizzled').must_equal 85
        end
    end
end
