module Scrabble
  class Dictionary
    attr_reader :words

    def initialize
      @words = File.read("support/words.txt").split("\n")
    end

    def valid_word?(word)
      raise ArgumentError.new("Word must be string") if word.class != String
      @words.include? word.downcase
    end
  end
end
