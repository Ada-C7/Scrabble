require_relative 'scoring'
require_relative 'tile_bag'
require 'terminal-table'

#We made a board but didn't get much farther than that on the optional

module Scrabble
  class Board

    def initialize
      letters = ("A".."O").map{|letter| letter = [letter] }
      @gameboard = letters.each_with_index do |letter, index|
          (1..15).each{|num| letter << num}
      end
    end

    def gameboard
      @gameboard
    end

    def score(name)
      Scoring.score(name)
    end

    def play(word)
      return false if won?
      raise ArgumentError.new "This requires a string" if word.class != String

      return score(name)
    end

    def display_board
      display_board = @gameboard
      display_board.unshift(%w(  A B C D E F G H I J K L M N O))

      table = Terminal::Table.new do |t|
        t.rows = display_board
      end
      return table
    end
  end
end

#this displays my pretty board
my_board = Scrabble::Board.new
puts my_board.display_board
