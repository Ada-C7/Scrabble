require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

describe Scrabble::Player do
    before do
        @new_player = Scrabble::Player.new('Tofu')
    end
    describe '#initialize' do
        it 'creates a new instance of player' do
            Scrabble::Player.new('Tofu').must_be_instance_of Scrabble::Player
        end

        it 'returns .name as a string' do
            Scrabble::Player.new('Danielle').name.must_be_kind_of String
        end

        it 'returns the name of the player correctly' do
            Scrabble::Player.new('Tofu').name.must_equal 'Tofu'
        end

        it 'initializes @player_score holds 0' do
            Scrabble::Player.new('Tofu').total_score.must_equal 0
        end
    end

    describe '#plays' do
        it 'returns .plays as an Array' do
            @new_player.plays.must_be_kind_of Array
        end
        it 'returns all 5 words played in order' do
            words = %w(zip sqeeze whiz jerky pig)
            words.each { |word| @new_player.play(word) }
            @new_player.plays.must_equal words
        end
    end

    describe '#play(word)' do
        it 'returns .play(word) as an Integer' do
            @new_player.play('whiz').must_be_kind_of Integer
        end

        it 'returns the correct score of the word' do
            @new_player.play('zaz').must_equal 21
        end

        it 'adds the input word to the plays array' do
            @new_player.play('word')
            @new_player.plays.must_include 'word'
        end

        it 'returns the correct score of a 7-letter word' do
            @new_player.play('squeeze').must_equal 75
        end

        it 'returns false if the player has already won' do
            @new_player.play('zzzzzzz')
            @new_player.play('word').must_equal false
        end

        it 'wont add to the score if the player has already won' do
            @new_player.play('zzzzzzz')
            @new_player.play('jazz')
            @new_player.total_score.must_equal 120
        end

        it 'Raises an error if incorrect argument is given' do
            proc { @new_player.play(7) }.must_raise ArgumentError
            proc { @new_player.play }.must_raise ArgumentError
            proc { @new_player.play('word!') }.must_raise ArgumentError
            proc { @new_player.play('reallylongword') }.must_raise ArgumentError
        end
    end

    describe '#total_score' do
        it 'returns .total_score as an Integer' do
            %w(zip sqeeze whiz jerky pig).each { |word| @new_player.play(word) }
            @new_player.total_score.must_be_kind_of Integer
        end
        it 'returns sum of scores of played words' do
            %w(z zzz zz zqaa).each { |word| @new_player.play(word) }
            @new_player.total_score.must_equal 82
        end
    end

    describe '#won?' do
        it 'returns #won as a Boolean value' do
            [true, false].must_include @new_player.won?
        end
        it 'returns true when the player has over 100 pts' do
            @new_player.play('zzzzzzz')
            @new_player.won?.must_equal true
        end
        it 'returns true when the player has exactly 100 pts' do
            @new_player.play('zzzzz')
            @new_player.play('qqqqq')
            @new_player.won?.must_equal true
        end
    end

    describe '#highest_scoring_word?' do # returns word
        before do
            @new_player.play('qqqqq')
            @new_player.play('zaz')
            @new_player.play('aaaaaa')
        end
        it 'returns .highest_scoring_word as a String' do
            @new_player.highest_scoring_word.must_equal 'qqqqq'
        end
        it 'returns the first word for duplicate high scores' do
            @new_player.play('zzzzz')
            @new_player.highest_scoring_word.must_equal 'qqqqq'
        end
    end

    describe '#highest_word_score?' do # returns score
        before do
            @new_player.play('qqqqq')
            @new_player.play('zaz')
            @new_player.play('aaaaaa')
        end
        it 'returns .highest_word_score as an Integer' do
            @new_player.highest_word_score.must_be_instance_of Integer
        end
        it 'returns the highest scoring word from unique scores' do
            @new_player.highest_word_score.must_equal 50
        end
        it 'returns one score from tied highest word scores' do
            @new_player.play('zzzzz')
            @new_player.highest_word_score.must_equal 50
        end
    end
end
