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
        # ZIP 14
        # JAZZ 29 WHIZ 19 JERKY 19
        # SQUEEZE 75  7-letter
        # QUICKLY 75 7-letter

        it 'Returns an String' do
            Scrabble::Scoring.highest_score_from(%w(cat dog zizzle)).must_be_kind_of String
        end

        it 'Returns the correct word' do
            array_of_words = %w(zip jazz) # 14, 19
            expected = 'jazz'
            Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
        end

        it 'Breaks ties with shortest word' do
            array_of_words = %w(QUAmZy zip JAZZ) # 29, 14, 29
            expected = 'JAZZ'
            Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
        end

        it 'if there is a tie of same score and same length, return first found' do
            array_of_words = %w(whiZ zip fhiz) # 19, 14, 19
            expected = 'whiZ'
            Scrabble::Scoring.highest_score_from(array_of_words).must_equal expected
        end
    end
end

### WAVE II NOTES

describe 'Scrabble::Player' do
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

        it 'initializes @won with value of false' do
            Scrabble::Player.new('Tofu').won.must_equal false # need attr for won
        end

        it 'initializes @player_score holds 0' do
            Scrabble::Player.new('Tofu').player_score.must_equal 0
        end
    end

    # ZIP 14
    # JAZZ 29 WHIZ 19 JERKY 19
    # SQUEEZE 75  7-letter
    # QUICKLY 75 7-letter

    describe '#plays' do
        it 'returns .plays as an Array' do
          Scrabble::Player.new('Tofu').plays.must_be_kind_of Array
        end
        it 'returns all 5 words played in order' do
          player = Scrabble::Player.new('Tofu')
          words = %w(zip sqeeze whiz jerky pig)
          words.each { |word| player.play(word) }
          player.plays.must_equal words
        end
    end

    describe '#play(word)' do
        it 'returns .play(word) as an Integer' do
          Scrabble::Player.new('Tofu').play('whiz').must_be_kind_of Integer
        end

        it 'returns the correct score of a 7-letter word' do
          Scrabble::Player.new('Tofu').play('squeeze').must_equal 75
        end

        it 'returns false if @won is true' do
          player = Scrabble::Player.new('Tofu')
          @won = true
          Scrabble::Player.new('Tofu').play('jazz').must_equal false
        end
    end

    describe '#total_score' do
        it 'returns .total_score as an Integer' do
        end
        it 'returns sum of scores of played word' do
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
