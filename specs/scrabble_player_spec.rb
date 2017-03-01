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
      end
      it "object.play(word) would return correct score"  do
        @new_player.play("hi").must_equal 5

      end
    end
  end
