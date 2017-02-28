module Scrabble

  class Scoring
    LETTERS_VALUES = {
      1 => %w(A E I O U L N R S T),
      2 => %w(D G),
      3 => %w(B C M P),
      4 => %w(F H V W Y),
      5 => %w(K),
      8 => %w(J X),
      10 => %w(Q Z)
    }
    attr_reader :letters_values

    def initialize

    end

  end
end

score = Scrabble::Scoring.new

puts Scrabble::Scoring::LETTERS_VALUES
