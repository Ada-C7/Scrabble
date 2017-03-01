require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe Scrabble::Scoring do
    before do
        @new_scrabble = Scrabble::Scoring.new
    end
    describe 'score(word)' do
        it 'Returns an integer' do
            @new_scrabble.score('word').must_be_instance_of Integer
        end

        it 'Returns the correct score' do
            @new_scrabble.score('word').must_equal 8
        end

        it 'Raises error for words with numbers' do
            proc { @new_scrabble.score('word4') }.must_raise ArgumentError
        end

        it 'Raises error for words with special characters' do
            proc { @new_scrabble.score('w#ord') }.must_raise ArgumentError
        end

        it 'Raises error for words with spaces' do
            proc { @new_scrabble.score('w or d') }.must_raise ArgumentError
        end

        it 'Argument is case insensitive' do
            @new_scrabble.score('wOrD').must_equal 8
        end

        it 'A seven letter word results in 50 point bonus' do
            @new_scrabble.score('zizzled').must_equal 85
        end
    end

    # raise error if there's non-alpha entered

    describe 'highest_score_from(array_of_words)' do
        # ZIP 14
        # JAZZ 29 WHIZ 19 JERKY 19
        # SQUEEZE 75  7-letter
        # QUICKLY 75 7-letter

        it 'Returns an String' do
            @new_scrabble.highest_score_from(%w(cat dog zizzle)).must_be_kind_of String
        end

        it 'Returns the correct word' do
            array_of_words = %w(zip jazz) # 14, 19
            expected = 'jazz'
            @new_scrabble.highest_score_from(array_of_words).must_equal expected
        end

        it 'Breaks ties with shortest word' do
            array_of_words = %w(QUAmZy zip JAZZ) # 29, 14, 29
            expected = 'JAZZ'
            @new_scrabble.highest_score_from(array_of_words).must_equal expected
        end

        it 'if there is a tie of same score and same length, return first found' do
            array_of_words = %w(whiZ zip fhiz) # 19, 14, 19
            expected = 'whiZ'
            @new_scrabble.highest_score_from(array_of_words).must_equal expected
        end
    end
end
