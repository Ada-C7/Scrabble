require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/player'

describe "Player Class" do
before do  "Create an instance"
  tofu = Scrabble::Player.new

  describe "Module Scrabble, Player Class" do
    it "exists" do
      # skip
      tofu.class.must_be_kind_of Class
    end

  describe "Player class has a name" do
    it "Will return a string when .name is called"
    tofu.name.must_be_kind_of String
    end
  end



  end






end
