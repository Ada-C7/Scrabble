require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/dictionary'
Minitest::Reporters.use!

describe  "Scrabble::Dictionary class" do
  describe "Dictionary#initialize"  do
    it "Class initializes with an array" do
      my_dictionary = Scrabble::Dictionary.new
      my_dictionary.words.class.must_equal Array
    end
    it "Array of words is not empty" do
      my_dictionary = Scrabble::Dictionary.new
      my_dictionary.words.wont_be_empty
    end
  end

  describe "Dictionary#valid_word?(word)"  do
    it "Raises ArgumentError if argument is not a string" do
      proc {
        my_dictionary = Scrabble::Dictionary.new
        my_dictionary.valid_word?(647)
      }.must_raise ArgumentError
    end
    it "Must return true or false" do
      my_dictionary = Scrabble::Dictionary.new
      my_dictionary.valid_word?("hello").must_equal true
      my_dictionary.valid_word?("jjajaaj").must_equal false
    end
  end
end # end of class
