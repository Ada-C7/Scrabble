
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

    def validate_players_word(word)
      raise ArgumentError.new "must be string" if word.class != String
      return @dictionary.include?(word) ? true : false
    end
  end
end
