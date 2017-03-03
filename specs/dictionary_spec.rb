require_relative 'spec_helper'
require_relative '../lib/dictionary'

describe Scrabble::Dictionary do

  describe "#initialize" do
    it "Initializes with a hash of valid words" do
      Scrabble::Dictionary.valid_words.must_be_instance_of Hash
    end

    it "Stores valid words by word length" do
      Scrabble::Dictionary.valid_words[5].all? { |word| word.length == 5 }.must_equal true
    end
  end

  describe "#valid_word?" do
    it "Returns true for a valid word" do
      Scrabble::Dictionary.valid_word?("SALMON").must_equal true
    end

    it "Is case insensitive" do
      Scrabble::Dictionary.valid_word?("salmon").must_equal true
    end

    it "Outputs word-not-found message for an invalid word" do
      proc {
        Scrabble::Dictionary.valid_word?("aaaaaaaa")
      }.must_output
    end

    it "Outputs word-not-found message for word with invalid characters" do
      proc {
        Scrabble::Dictionary.valid_word?("$$$$^^^")
      }.must_output
    end

    it "Outputs word-not-found message if there are no words of that length" do
      proc {
        Scrabble::Dictionary.valid_word?("I")
      }.must_output
    end
  end
end
