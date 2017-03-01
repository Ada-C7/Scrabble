require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/player'

describe "Player Class" do

  describe "Module Scrabble, Player Class" do
    it "exists" do
      # skip
      Scrabble::Player.class.must_be_kind_of Class
    end
  end






end
