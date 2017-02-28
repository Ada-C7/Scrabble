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

     #fingers crossed this saves them as corresponding words and scores in individual arrays
      scorepairs = word_array.zip(score_array)


      # iterate over score array to find highest scores

    top_scores = []
    scorepairs.each do |scorepair|
        if scorepair[1] == score_array.max
            top_scores <<scorepair
        end
    end

      #no tie, nominal case returns the undisputed winner
        if top_scores.length == 1
            return top_scores[0][0]
        end

      # handle ties
      top_scores.each do |scorepair|
          if scorepair[0].length == 7
              return scorepair[0]
          end
        end

    #handles tied scores by finding the shortest word
      shortest= top_scores.min_by do |scorepair|
          scorepair[0].length
    end
        return shortest[0]


        # tied_words.map do |str|
        #     str.length
        # end

        #this is just returning the length of the string that wins, not the word
        # winner = tied_words.min



    end

  end
end
