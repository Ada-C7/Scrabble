require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe Scrabble::Scoring do
  describe 'self.score(word)' do
    it 'Returns an integer' do
      Scrabble::Scoring.score('word').must_be_kind_of Integer
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
# ZIP 14
# JAZz 19 WHIZ 19 JERKY 19
# SQUEEZE 75  7 letter
# QUICKLY 75 7 letter

    it 'Returns an Array' do
      skip
      Scrabble::Scoring.highest_score_from(array_of_words).must_be_kind_of Array
    end

    it 'Returns the correct word' do
      skip
      array_of_words = ['zip', 'jazz'] #14, 19
      expected = 'jazz'
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
    end

    it 'Breaks ties with shortest word' do
      skip
      array_of_words = ['Jerky', 'zip', 'JAZZ'] #19, 14, 19
      expected = 'JAZZ'
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
    end

    it 'if there is a tie of same score and same length, return first found' do
      skip
      array_of_words = ['whiZ', 'zip', 'jazz'] #19, 14, 19
      expected = 'whiZ'
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
    end
  end
end
