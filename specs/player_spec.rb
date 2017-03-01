require_relative 'spec_helper'
require_relative '../lib/player.rb'
#require_relative 'scoring.rb'

describe "Wave 2" do
    before do
        @my_player = Scrabble::Player.new('Watson')
    end

    describe "initialize method" do
        it "Player.new is an instance of a player" do
            @my_player.must_be_instance_of Scrabble::Player
        end

        it "New Players initialize with a name" do
            @my_player.name.must_equal 'Watson'
        end

        it "Is @plays an array" do
            @my_player.plays.must_be_instance_of Array
        end

    end

end
