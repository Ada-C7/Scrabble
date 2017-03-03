#require_relative '../resources/dictionary.txt'

module Scrabble
  class Dictionary
    attr_reader :dictionary

    def initialize
      build_list
    end

    def build_list
      @dictionary = []
      file = File.open("resources/dictionary.txt", "r")
      file.each do |word|
        @dictionary << word.strip if word.strip.length < 8
      end
    end
    # method to generate the list of words / Dictionary from a text file... could be in initialize

    def validate_players_word(word)
      raise ArgumentError.new "must be string" if word.class != String
      return @dictionary.include?(word) ? true : false
    # method to validate word given by a player(will check our word list)
    end
  end
end

# testing = Scrabble::Dictionary.new
# testing.build_list
# puts testing.dictionary.select { |word| word.length == 7 }
