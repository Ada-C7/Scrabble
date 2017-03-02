require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new


describe Scrabble::Player do

  before do
    @player = Scrabble::Player.new("Boo")
  end

  describe "Player#initialize" do
    it "takes a name" do
      name = "Boo"
      player = Scrabble::Player.new(name)

      player.must_respond_to :name
      player.name.must_equal id
    end

    it "is a kind of Player" do
      @player.must_be_kind_of Scrabble::Player
    end
  end

  describe "Player#play" do
    it do
      
    end


  end
end
