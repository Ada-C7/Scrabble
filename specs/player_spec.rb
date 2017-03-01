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
            Scrabble::Player.new('Tofu').player_score.must_equal 0
        end
    end

    # sample words:
    # ZIP 14 JAZZ 29 WHIZ 19 JERKY 19
    # 7-letter: SQUEEZE 75 QUICKLY 75

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

        it 'returns the correct score of a 7-letter word' do
            @new_player.play('squeeze').must_equal 75
        end

        it 'returns false if @won is true' do
            @new_player.play('zzzzzzz')
            @new_player.play('jazz').must_equal false
        end
    end

    describe '#total_score' do
        it 'returns .total_score as an Integer' do
            %w(zip sqeeze whiz jerky pig).each { |word| @new_player.play(word) }
            @new_player.total_score.must_be_kind_of Integer
        end
        it 'returns sum of scores of played word' do
            %w(zip sqeeze whiz).each { |word| @new_player.play(word) }
            @new_player.total_score.must_equal 89
        end
    end

    describe '#won?' do
        it 'returns #won as a Boolean value' do
        end
        it 'returns true when the player has over 100 pts' do
        end
        it 'returns true when the player has exactly 100 pts' do # edge case
        end
    end

    describe '#highest_scoring_word?' do # returns word
        it 'returns .highest_scoring_word(array) as a String' do
        end
        it 'returns the first word for duplicate high scores' do
        end
    end

    describe '#highest_word_score?' do # returns score
        it 'returns .highest_word_score(array) as an Integer' do
        end
        it 'returns the highest scoring word from unique scores' do
        end
        it 'returns one score from tied highest word scores' do
        end
    end
end
