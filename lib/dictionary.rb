module Scrabble
  class Dictionary
    attr_reader :valid_words

    def initialize
      @valid_words = File.read("support/dictionary.txt").split("\n").group_by { |word| word.length }
    end

    def valid_word?(word)
      @valid_words[word.length].include? word.upcase
    end
  end
end
