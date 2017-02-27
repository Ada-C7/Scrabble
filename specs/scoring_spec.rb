require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scoring'

describe "Scrabble::Scoring" do

  # before do
  #   @game = Scrabble::Scoring.new
  # end

  # test if letters have correct values attached
  it "Letters have correct values" do

    # 1_point = [:A, :E, :I, :O, :U, :L, :N, :R, :S, :T]
    # 2_point = [:D, :G]
    # 3_point = [:B, :C, :M, :P]
    # 4_point = [:F, :H, :V, :W, :Y]
    # 5_point = [:K]
    # 8_point = [:J, :X]
    # 10_point = [:Q, :Z]

    LETTER_VALUES[:A].must_equal 1

  end

# test that word is scored correctly
# also correct in case of: 7 letter word
# score method returns correct score
# word and score are pushed to @wordarray
# test that highest score method calculates correctly
# test that highest score is returned
# test that highest score handles ties


end
