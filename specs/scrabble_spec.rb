gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble'

describe "Scrabble::Scoring" do

  describe "score" do

    before do
      @score_value = Scrabble::Scoring.score("sample")
    end

    it "returns integer" do
      @score_value.must_be_kind_of Integer
    end

    it "returns correct score for word" do
      @score_value.must_equal 10
    end

    it "raises argument error if word has numbers" do
      proc {
        Scrabble::Scoring.score(123)
      }.must_raise ArgumentError
    end

    it "raises argument error if word has symbols" do
      proc {
        Scrabble::Scoring.score("***")
      }.must_raise ArgumentError
    end
  end

  describe "self.highest_score_from" do


    it "returns a string" do
      array = ["zzz", "aaa"]
      Scrabble::Scoring.highest_score_from(array).must_be_instance_of String
    end

    it "returns word with highest score" do
      array = ["zzz", "aaa"]
      Scrabble::Scoring.highest_score_from(array).must_equal "zzz"
    end

    it "picks word with fewer letters in a point tie" do
      array = ["dog", "louie"]
      Scrabble::Scoring.highest_score_from(array).must_equal "dog"
    end

    it "picks 7 letter word if there is a point tie" do
      array = ["aaaaaad", "zzzzzx"]
      Scrabble::Scoring.highest_score_from(array).must_equal "aaaaaad"
    end

    it "picks first word as winner if letters and point are equal" do
      array = ["dog", "gog"]
      array2 = ["gog", "dog"]


      Scrabble::Scoring.highest_score_from(array).must_equal "dog"
      Scrabble::Scoring.highest_score_from(array2).must_equal "gog"

    end


  end


end

describe "Scrabble::Player" do




  before do
    @person = Srabble::Player.new("you123***")
  end

  it "person is a string without numbers or symbols"
  if @person == String #comparing numbers to string?
    run code
  elsif
    it "raises argument error if name contains symbols" do
      @person.include?("***")
      raises ArgumentError
    elsif
      it "raises argument error if name contains numbers" do
        @person.include(123)
        raises ArgumentError
      end


      describe "initialize method" do

        it "must raise error if name parameter is not string" do
          proc { Scrabble::Player.new.(123)}.must_raise ArgumentError
        end

        it "must raise error if name parameter is not all letters" do
          proc { Scrabble::Player.new("***")}.must_raise ArgumentError
        end

        it "must be an instance of Player class" do
          @my_player.must_be_instance_of Scrabble::Player
        end

    end

    describe "plays method" do
      it "returns an array" do
        @my_player.Scrabble::Player.plays.must_be_instance_of Array
      end

      it "returns an array of words played by the player" do
        @my_player.Scrabble::Player.play("abc")
        @my_player.Scrabble::Player.play("def")
        @my_player.Scrabble::Player.plays.must_equal ["abc", "def"]
      end
    end

describe "play(word) method" do

  it "does not allow player to play if points will go over 100 after play" do
  @winner = Scrabble::Player.new("winner")
  4.times do @winner.Scrabble::Player.play("zzz")

  proc { @winner.Scrabble::Player.play("zzz")}.must_raise ArgumentError
end

it "returns the score of the game" do
  @my_player.Scrabble::Player.play("aaa").must_equal 3

end
end

end

  end
