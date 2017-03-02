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

        it "doesn't execute if player has won" do
            @my_player.play("zzzzz")
            @my_player.play("qqqq")
            @my_player.play("kka")
            @my_player.play("banana")
            @my_player.plays.length.must_equal 3
        end
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

      describe "checks the won method " do
        it "remains false under 100" do
          @my_player.play("zzzzz")
          @my_player.play("qqqq")
          @my_player.play("kh")
          @my_player.won?.must_equal false
        end


        it "still false when 100" do
            @my_player.play("zzzzz")
            @my_player.play("qqqq")
            @my_player.play("kk")
            @my_player.won?.must_equal false
        end

        it "is true over 100" do
            @my_player.play("zzzzz")
            @my_player.play("qqqq")
            @my_player.play("kka")
            @my_player.won?.must_equal true
        end

      end

      describe "highest scoring word and highest word score method" do
        before do
          @my_player.play("cat")
          @my_player.play("potato")
          @my_player.play("flea")
        end

        it "highest scoring word returns a string of the correct value" do
          @my_player.highest_scoring_word.must_be_instance_of String
          @my_player.highest_scoring_word.must_equal "potato"
        end

        it "highest word score returns an integer of the correct value" do
          @my_player.highest_word_score.must_be_instance_of Fixnum
          @my_player.highest_word_score.must_equal 8
        end
      end


end

xdescribe "Wave 3" do

  describe "tiles variable" do
    it "is an array of strings" do

    end

    it "cannot go above 7 tiles" do

    end
  end

  describe "draw_tiles for Player class" do
    it "fills tiles array with letters" do

    end

    it "won't fill the array beyond 7 letters" do

    end

  end
end
