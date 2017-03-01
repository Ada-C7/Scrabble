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

      describe "Play" do
        it "Word must be a string" do
          proc { @new_player.play(123)}.must_raise ArgumentError
        end

        it "object.play(word) would return correct score"  do
          @new_player.play("hi").must_equal 5
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
      end

      describe "#won?" do
        it "should return a value of true if score > 100" do
          @new_player.play("zzzzzzz")
          @new_player.won?.must_equal true
        end

        describe "#highest_scoring_word" do
          it "returns the highest scoring played word" do
            @new_player.play("hi")
            @new_player.play("day")
            @new_player.highest_scoring_word.must_equal "day"
          end
        end
        describe "#highest_word_score" do
          it "returns the score of the winning word" do
            @new_player.play("hi")
            @new_player.play("day")
            @new_player.highest_scoring_word.must_equal "day"
            @new_player.highest_word_score.must_equal 7
          end
        end
      end

    end


  end
