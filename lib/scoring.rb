require 'csv'

module Scrabble

  class Scoring
    SCORE_CHART = {'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
      'N' => 1, 'R' => 1,  'S' => 1, 'T'=> 1,
      'D' => 2, 'G' => 2,
      'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
      'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
      'K' => 5,
      'J' => 8, 'X' => 8,
      'Q' => 10, 'Z' => 10 }
      # attr_reader :score_chart
      # def initialize
      #   @score_chart = []
      #   CSV.open("support/score_chart.csv").each do |line|
      #     @score_chart << line[1..-1]
      #   end

    def self.score(word)
      4
    end

    def self.highest_score_from(array_of_words)
    end
  end
end

# letter = Scrabble::Scoring.new
# print letter.score_chart
