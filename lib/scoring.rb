module Scrabble
  SCORING = [
    {1 => [A, E, I, O, U, L, N, R, S, T]},
    {2 => [D, G]},
    {3 =>[B, C, M, P]},
    {4 =>[F, H, V, W, Y]},
    {5 => [K]},
    {8 => [J, X]},
    {10 => [Q, Z]}
  ]
  class Scoring
    attr_reader :word_array
    # def initialize
    # end
    def self.score(word)
      SCORING.each do |score|
        score.each do |score, letter|
          if letter.include?
          end
        end
      end
    end

    # def self.highest_score_from(array_of_words)
    # end

  end
end

Scrabble::Scoring.score("potato")
