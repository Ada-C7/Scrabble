require_relative 'spec_helper'
require_relative '../lib/dictionary'

describe Scrabble::Dictionary do
  before do
    @dict = Scrabble::Dictionary.new
  end

  describe "#initialize" do
    it "Initializes with a hash of valid words" do
      @dict.valid_words.must_be_instance_of Hash
    end

    it "Stores valid words by word length" do
      @dict.valid_words[5].all? { |word| word.length == 5 }.must_equal true
    end
  end

  describe "#valid_word?" do
    it "Returns true for a valid word" do
      @dict.valid_word?("SALMON").must_equal true
    end

    it "Is case insensitive" do
      @dict.valid_word?("salmon").must_equal true
    end

    it "Returns false for an invalid word" do
      @dict.valid_word?("aaaaaaaa").must_equal false
    end

    it "Returns false for word with invalid characters" do
      @dict.valid_word?("$$$$^^^").must_equal false
    end
  end
end
