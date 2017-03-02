require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'
require_relative '../lib/player'



Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


describe Scrabble::Player do

  before do
    @player = Scrabble::Player.new("Boo")
  end
  #
  # describe "Player#initialize" do
  #   it "takes a name" do
  #     name = "Boo"
  #     player = Scrabble::Player.new(name)
  #
  #     player.must_respond_to :name
  #     player.name.must_equal id
  #   end
  #
  #   it "is a kind of Player" do
  #     @player.must_be_kind_of Scrabble::Player
  #   end
  #
  #   it "returns an array of played words" do
  #     played_words = ["book", "quiver", "pen"]
  #     3.times { |n| @player.play(n) }
  #
  #     @player.plays.must_equal played_words
  #   end


  # end


  #
  # describe "Player#play" do
  #   it "returns a string" do
  #   end
  #
  # end
  #
  #

     before do
       @played_words = %w(grits gravy biscuit greens)
       @player = Scrabble::Player.new("Ada", @played_words)
     end

     describe 'Total score of player' do
          it 'Returns the score of the highest_scoring_word' do
               @player.total_score.must_equal 86
          end
     end

     describe 'Whether player won' do
          it 'Returns false until player has exceed 100 points. Then returns true.' do
               @player.play("bacon")
               @player.won?.must_equal false

               @player.play("bacon")
               @player.won?.must_equal true
          end
     end

     describe 'Highest scoring word played by player' do
          it 'Returns string with the most points.' do
               @player.highest_scoring_word.must_equal "biscuit"
          end
     end

     describe 'Score of highest scoring word played by player' do
          it 'Returns value of string with the most points.' do
               @player.highest_word_score.must_equal 61
          end
     end
end
