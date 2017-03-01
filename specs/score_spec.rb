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


     describe 'feature to score word' do

          before do
               @my_word = Scrabble::Scoring
          end

          it "raises an argument error if argument isn't a string" do
               proc { @my_word.score(1) }.must_raise ArgumentError
          end

          it "raises an argument error if string contains something other than letters" do
               proc { @my_word.score("1ab3c4") }.must_raise ArgumentError
          end

          it  "doesn't allow a word longer than seven tiles" do
               proc { @my_word.score("1ab3c4de") }.must_raise ArgumentError
          end

          it  "doesn't allow a word shorter than two tiles" do
               proc { @my_word.score("a") }.must_raise ArgumentError
          end

          # it 'word can be any case' do
          #      proc { @my_word.score("abcdef") }.wont_raise ArgumentError
          #      proc { @my_word.score("ABCDEF") }.wont_raise ArgumentError
          #
          # end
          #
          # it  "returns the total score (integer) for the given word" do
          #      proc { @my_word.score("aaa") }.must_equal 3
          #      proc { @my_word.score("aaa") }.must_be_kind Integer
          # end
          #
          # it  "calculates points according to the scoring chart" do
          # end
          #
          # it  "awards 50 points for seven tiles" do
          # end

     end


     describe "self.highest_score_from(words)" do
       it "returns a string" do
         array = ["aaa", "bbb", "ccc", "dddddd"]
         word = Scrabble::Scoring.highest_score_from(array)

         word.must_be_instance_of String
       end

       it "returns a word with the highest score" do
         array = ["aaa", "bbb", "ccc", "dddddd"]
         winner = "dddddd"
         word = Scrabble::Scoring.highest_score_from(array)

         word.must_equal winner
       end

       it "returns the word that is 7 strings long in case of a tie" do
         array = ["hhh", "xxxxx", "aaaaaaa"]
         winner = "aaaaaaa"
         word = Scrabble::Scoring.highest_score_from(array)

         word.must_equal winner
       end

       it "returns shortest word in case of a tie" do
         array = ["xxx", "xxhh", "zzaaaa"]
         winner = "xxx"
         word = Scrabble::Scoring.highest_score_from(array)

         word.must_equal winner
       end

       it "returns the first word in tie that has words of equal length and points" do
         array = ["fff", "hhh", "vvv"]
         winner = "fff"
         word = Scrabble::Scoring.highest_score_from(array)

         word.must_equal winner
       end

       it "Outpus warning if the array contains non letter characters" do
         array = ["bo1", "bzzz", "br@e"]

         proc {
           Scrabble::Scoring.highest_score_from(array)
         }.must_raise ArgumentError
       end

     end

end
