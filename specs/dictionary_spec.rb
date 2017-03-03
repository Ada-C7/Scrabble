require_relative 'spec_helper'
require_relative '../lib/dictionary.rb'


describe "Dictionary is a class" do
  before do
    @test_dictionary = Scrabble::Dictionary.new
  end
  it "must be type of Dictionary" do
    test_d = Scrabble::Dictionary.new
    test_d.must_be_instance_of Scrabble::Dictionary
  end

  describe "initialize" do
    it "if we create a new instance of dictionary, build_list should run" do
      @test_dictionary.dictionary.empty?.must_equal false
    end

    it "Make sure the first word < 8 letters is read in from file" do
      @test_dictionary.dictionary.include?("aa").must_equal true
    end

    it "Make sure the last word < 8 letters is read in from file" do
      @test_dictionary.dictionary.include?("zyzzyva").must_equal true
    end

    it "Dictionary only contains words that are 7 letters long or less" do
      @test_dictionary.dictionary.each do |word|
        word.length.must_be :<, 8
      end
    end
  end



end
