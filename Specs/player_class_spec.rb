# require 'minitest/autorun'
# require 'minitest/reporters'
# require 'minitest/skip_dsl'
# require_relative '../lib/player_class'
#
# xdescribe "Player Class" do
#
#   before do
#     Ada = Scrabble::Player.new("Ada")
#     @word = "camp"
#     @edge_word = "W@ter"
#     @array = ["Tweens", "Camp", "toy" ,"Key", "aeiourh", "Doloring"]
#     @array2 = ["camp", "pamc", "toy", "love"]
#   end
#
#   it "Creates a new instance of player" do
#     Ada.must_be_instance_of Scrabble::Player
#   end
#
#   it "Raises argumentError if word contains anything other than letters" do
#     proc { Ada.play(@edge_word) }.must_raise ArgumentError
#   end
#
#   it "Handles if the word passed has a space (two words)" do
#     proc { Ada.play("Two Words") }.must_raise ArgumentError
#   end
#
#   it "Handles if the word passed has cAmeLCase " do
#     Ada.play("cAmeLCase").must_be_kind_of Integer
#   end
#
#   it "Play(word) outputs integer" do
#     Ada.play(@word).must_be_kind_of Integer
#   end
#
#   it "Play(word) outputs the correct score" do
#     Ada.play(@word).must_equal 10
#   end
#
#
#   it "Play(word) returns false if player has already won " do
#     10.times do
#       Ada.play(@word)
#     end
#     Ada.play(@word).must_equal "false"
#   end
#
#
#   it "Play(word) adds a word to @plays array" do
#     previous_length = Ada.plays.length
#     Ada.play("quizzed")
#     Ada.plays.length.must_be :>, previous_length
#   end
#
#
#   it " won? returns 'true' if player has greater than or equal to 100 points " do
#     skip
#   end
#
#   it " won? returns 'false' if player has less than 100 points " do
#     skip
#   end
#
#
#   it " highest_word_score returns the *score* for the highest scoring word" do
#     skip
#   end
#
#   it "highest_scoring_word returns the *word* with the highest score" do
#     skip
#   end
# 
# end
