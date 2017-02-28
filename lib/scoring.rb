module Scrabble
  class Scoring

    def self.score(word)
      letter_scores = {
        a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1,
        d: 2, g: 2,
        b: 3, c: 3, m: 3, p: 3,
        f: 4, h: 4, v: 4, w: 4, y: 4,
        k: 5,
        j: 8, x: 8,
        q: 10, z: 10
      }

      #store word as characters in array
      char_array = word.downcase.split("")

    # convert character array to symbol array

    sym_array = []

    char_array.each do |char|
        sym_array << char.to_sym
    end

    word_score = 0
    sym_array.each do |symbol|
        word_score += letter_scores[symbol]
    end

    if sym_array.length == 7
      word_score += 50
    end
    word_score

    end

    def self.highest_score(word_array)
      score_array = []

      # iterate over word array
      # push each score into matching score array
      word_array.each do |word|
        score_array << self.score(word)
      end


      # iterate over score array to find highest scores

      top_indexes = []
      score_array.each_with_index do |score, index|
          if score == score_array.max

              top_indexes << index
          end
      end

      #no tie, nominal case returns the undisputed winner
      if top_indexes.length == 1
        return word_array[top_indexes[0]]
      else


      # handle ties
        # if word has seven letters it should win
        # if more than one word has seven letters, first should win
        top_indexes.each do |index|
          if word_array[index].length == 7
            return word_array[index]
        end
        end

        tied_words = []
        top_indexes.each do |index|
            tied_words << word_array[index]
        end

        tied_words.map do |str|
            str.length
        end

        #this is just returning the length of the string that wins, not the word
        winner = tied_words.min

      end



    end

  end
end
