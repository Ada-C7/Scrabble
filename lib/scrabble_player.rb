module Scrabble

  puts "Please enter your username (characters only): "
   name = gets.chomp.to_s

  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def plays
  end
end


test = Scrabble::Player.new(123)
