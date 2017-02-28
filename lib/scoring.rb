require 'csv'

module Scrabble

  class Scoring
    attr_reader :score_chart
    def initialize
      @score_chart = []
      CSV.open("support/score_chart.csv").each do |line|
        @score_chart << line[1..-1]
      end
    end


    def self.score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end

letter = Scrabble::Scoring.new
print letter.score_chart
