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

  # raise error if there's non-alpha entered

  describe 'self.highest_score_from(array_of_words)' do
    it 'Returns an Array' do
      Scrabble::Scoring.highest_score_from(array_of_words).must_be_instance_of Array
    end

    it 'Returns the correct word' do

    end

    it 'Breaks ties with shortest word' do
    end

    it 'Seven letter words get 50 pt. bonus' do
    end

    it 'if there is a tie of same score and same length, return first found' do
    end
  end
end
