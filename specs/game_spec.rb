require_relative 'spec_helper'
require_relative '../lib/game'

describe Scrabble::Game do
  before do
    @s = Scrabble::Game.new("Ada","Beta")
  end

  describe "#initialize" do
    it "Initializes game with two player objects" do
      @s.active_player.must_be_instance_of Scrabble::Player
      @s.inactive_player.must_be_instance_of Scrabble::Player
    end
  end

  describe "#switch_players" do
    it "Switches active and inactive player" do
      starting_active = @s.active_player.name
      starting_inactive = @s.inactive_player.name
      @s.switch_players

      @s.active_player.name.must_equal starting_inactive
      @s.inactive_player.name.must_equal starting_active
    end
  end

  describe "#reset_turn" do
    it "Resets the current turn" do
      @s.current_turn = {word: 'TEST'}
      @s.reset_turn

      @s.current_turn.must_be :empty?
    end
  end

  describe "#valid_placement?" do
    it "Returns true if the board is blank and all params are valid" do
      @s.current_turn = {word: 'test', row: 10, column: 10, direction: 'right'}
      proc {
        @s.valid_placement?
      }.must_be_silent
    end

    it "Outputs error message if row is not between 1 and 15" do
      @s.current_turn = {row: 100, column: 10, direction: 'down'}
      proc {
        @s.valid_placement?
      }.must_output
    end

    it "Outputs error message if column is not between 1 and 15" do
      @s.current_turn = {row: 10, column: 100, direction: 'down'}
      proc {
        @s.valid_placement?
      }.must_output
    end

    it "Outputs error message if direction is not 'down' or 'right'" do
      @s.current_turn = {row: 10, column: 10, direction: 'left'}
      proc {
        @s.valid_placement?
      }.must_output
    end

    it "Outputs error message if there isn't space on the board" do
      @s.board.place_word({word: 'test', row: 10, column: 10, direction: 'right'})
      @s.current_turn = {word: 'test', row: 10, column: 10, direction: 'right'}
      proc {
        @s.valid_placement?
      }.must_output
    end
  end

  describe "#valid_tiles?" do
    it "Outputs error if the player does not have the tiles" do
      @s.current_turn = {word: 'test', row: 10, column: 10, direction: 'right'}
      proc {
        @s.valid_tiles?
      }.must_output
    end
  end

end
