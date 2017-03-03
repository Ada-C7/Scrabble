require_relative 'lib/board'
require_relative 'lib/dictionary'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/scoring'
require_relative 'lib/tilebag'

puts "FAKE SCRABBLE!"
print "Player 1, what's your name? "
player1_name = gets.chomp
print "Player 2, what's your name? "
player2_name = gets.chomp
puts

Scrabble::Game.new(player1_name, player2_name).play
