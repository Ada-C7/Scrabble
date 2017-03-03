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

  before do
       @my_word = Scrabble::Scoring
  end

     describe 'feature to score word' do

          it 'raises an argument error if argument is not a string' do
               proc { @my_word.score(1) }.must_raise ArgumentError
          end

          it 'raises an argument error if string contains something other than letters' do
               proc { @my_word.score("1ab3c4") }.must_raise ArgumentError
          end

          it  'does not allow a word longer than seven tiles' do
               proc { @my_word.score("1ab3c4de") }.must_raise ArgumentError
          end

          it  'does not allow a word shorter than two tiles' do
               proc { @my_word.score("a") }.must_raise ArgumentError
          end

          it 'word can be any case' do
               @my_word.score("abcdef").must_equal 14
               @my_word.score("ABCDEF").must_equal 14

          end

          it  'returns the total score (integer) for the given word' do
               @my_word.score("aaa").must_equal 3
               @my_word.score("aaa").must_be_kind_of Integer
          end

          it  "calculates points according to the scoring chart" do
               @my_word.score("bb").must_equal 6
               @my_word.score("zzzz").must_equal 40
               @my_word.score("jjj").must_equal 24
          end

          it  "awards 50 points for seven tiles" do
               @my_word.score("bbbbbbb").must_equal 71
               @my_word.score("zzzzzzz").must_equal 120
               @my_word.score("jjjjjjj").must_equal 106
          end

     end


     describe "self.highest_score_from(words)" do

       it "returns a string" do
         array = ["aaa", "bbb", "ccc", "dddddd"]

         @my_word.highest_score_from(array).must_be_instance_of String
       end

       it "returns a word with the highest score" do
         array = ["aaa", "bbb", "ccc", "dddddd"]
         winner = "dddddd"

         @my_word.highest_score_from(array).must_equal winner
       end

       it "returns the word that is 7 strings long in case of a tie" do
         array = ["hhh", "xxxxx", "aaaaaaa"]
         winner = "aaaaaaa"

         @my_word.highest_score_from(array).must_equal winner
       end

       it "returns shortest word in case of a tie" do
         array = ["xxx", "xxhh", "zzaaaa"]
         winner = "xxx"

         @my_word.highest_score_from(array).must_equal winner
       end

       it "returns the first word in tie that has words of equal length and points" do
         array = ["fff", "hhh", "vvv"]
         winner = "fff"

        @my_word.highest_score_from(array).must_equal winner
       end

       it "outpus warning if the array contains non letter characters" do
         array = ["bo1", "bzzz", "br@e"]

         proc {
           @my_word.highest_score_from(array)
         }.must_raise ArgumentError
       end

       it "does not allow empty array as an argument" do
         array = []

         proc {
           @my_word.highest_score_from(array)
         }.must_raise ArgumentError
       end
     end

end
