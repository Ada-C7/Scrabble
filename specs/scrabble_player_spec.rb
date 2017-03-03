require_relative '../specs/spec_helper.rb'
require_relative '../lib/scrabble_player'

describe "Player Class" do

  before do
    @new_player = Scrabble::Player.new("Lynn")
  end

  describe "Scrabble::Player#initialize" do
    it "Takes name to initialize " do
      @new_player.must_respond_to :name
    end
    it "Scrabble::Player(name) must be a String" do
      proc {
        Scrabble::Player.new(123)}.must_raise ArgumentError
      end
    end

    describe "Play" do
      it "Word must be a string" do
        proc { @new_player.play(123) }.must_raise ArgumentError
      end

      it "object.play(word) would return correct score as a fixnum"  do
        score = @new_player.play("hi")
        score.must_equal 5
        score.must_be_instance_of Fixnum
      end

      it "saves word to @plays array" do
        @new_player.play("hi")
        @new_player.plays.must_equal ["hi"]
      end

      it "returns fail if player has already won" do
        @new_player.play("zzzzzzz")
        @new_player.play("hi").must_equal false
      end

    end

    describe "#total_score" do
      it "returns the sum score of all the words played." do
        3.times { @new_player.play("hi") }
        @new_player.total_score.must_equal 15
      end

      it "should output 0 if player has not played any words" do
        @new_player.total_score.must_equal 0
      end
    end

    describe "#won?" do
      it "should return a value of true if score > 100" do
        @new_player.play("zzzzzzz")
        @new_player.won?.must_equal true
        @new_player.won?.must_be_instance_of TrueClass
      end

      it "should return false if score is < 100" do
        @new_player.won?.must_equal false
        @new_player.won?.must_be_instance_of FalseClass
      end

    end

    describe "#highest_scoring_word" do
      it "returns the highest scoring played word" do
        @new_player.play("hi")
        @new_player.play("day")
        @new_player.highest_scoring_word.must_equal "day"
      end

      it "returns ArgumentError if player has not played any words" do
        proc { @new_player.highest_scoring_word}.must_raise ArgumentError
      end
    end

    describe "#highest_word_score" do
      it "returns ArgumentError if player has not played any words" do
        proc { @new_player.highest_word_score}.must_raise ArgumentError
      end
      it "returns the score of the winning word" do
        @new_player.play("hi")
        @new_player.play("day")
        @new_player.highest_scoring_word.must_equal "day"
        @new_player.highest_word_score.must_equal 7
      end

      describe "draw_tiles" do
        before do
          @my_bag = Scrabble::TileBag.new
        end

        it "returns ArgumentError if argument is not class TileBag" do
          proc {@new_player.draw_tiles("hi")}.must_raise ArgumentError
        end

        it "returns an array of 7 tiles" do
          @new_player.draw_tiles(@my_bag)
          @new_player.tiles.length.must_equal 7
          @new_player.tiles.pop
          @new_player.draw_tiles(@my_bag)
          @new_player.tiles.length.must_equal 7
          # draw.must_be_instance_of Array
          # draw.length.must_equal 7

        end
      end


      describe "#tiles" do
        it "it returns an array of letters" do
          @new_player.tiles.must_be_instance_of Array
        end

      end
    end

  end
