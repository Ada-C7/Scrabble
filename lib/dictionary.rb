module Scrabble
  class Dictionary

    def self.valid_words
      @@valid_words ||= File.read("support/dictionary.txt")
        .split("\n").group_by { |word| word.length }
    end

    def self.valid_word?(word)

      if !valid_words.keys.include?(word.length) ||
        !valid_words[word.length].include?(word.upcase)
        
        puts "Word not found in Scrabble Dictionary."
        false
      else
        true
      end
    end

  end
end
