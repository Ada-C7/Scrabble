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



    describe "Play Method" do
        it "Accepts a string" do
        @my_player.play("torture")
        @my_player.plays[0].must_be_instance_of String
        end

        it "Raises an Argument if argument is not a string" do
            proc{@my_player.play(123)}.must_raise ArgumentError
        end

        it "raises an argument error if any character in string is not a letter" do
          proc {@my_player.play("frog!") }.must_raise ArgumentError
          proc {@my_player.play("fr3og") }.must_raise ArgumentError
        end

        it "adds a word to the plays array" do
          @my_player.play("biscuit")
          @my_player.plays.last.must_equal "biscuit"

        end

        it "adds three words with three plays, in the right order" do
          @my_player.play("alidade")
          @my_player.play("otter")
          @my_player.play("pinochle")
          @my_player.plays[-3].must_equal "alidade"
          @my_player.plays[-2].must_equal "otter"
          @my_player.plays[-1].must_equal "pinochle"
        end

        it "returns an integer" do
          @my_player.play("cat").must_be_instance_of Fixnum
        end

        it "returns correct score" do
          @my_player.play("cat").must_equal 5
        end

        xit "doesn't execute if player has won" do

        end

      describe "total_score method" do
        it "returns an integer" do
          @my_player.total_score.must_be_instance_of Fixnum
        end

        it "returns the correct total" do
          @my_player.play("cat")
          @my_player.play("pig")
          @my_player.total_score.must_equal 11
        end
      end


    end












end
