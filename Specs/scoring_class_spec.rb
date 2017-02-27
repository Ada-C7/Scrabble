require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring_class'

describe "Score Method for Scoring Class" do

  before do

    word = "camp"
    7_letter_word = quacked
    8_letter_word = bushbuck #small African antelope

  end


  it "Score Method outputs integer" do

    score(word).must_be_instance_of Interger

  end

  it "Score method will total the value of each letter in the word" do
      score(word).must_be_equal_to 10
  end

  it "Adds a 50 point bonus to a 7 letter word" do

  end

it "adds 50 point bonus on words greater than 7 letters "
end
