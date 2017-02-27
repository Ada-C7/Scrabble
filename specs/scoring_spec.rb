describe "Scrabble::Scoring" do

  before do
    easy_word = Scrabble::Scoring.new("moo")
    hard_word = Scrabble::Scoring.new("hipster")
  end

# test we can initalize Scoring
describe "New Scoring object is instance of Scrabble::Scoring class" do
  easy_word.must_be_instance_of Scrabble::Scoring
end
# test if letters have correct values attached
describe "Letters have correct values" do

end

# test that word is scored correctly
# also correct in case of: 7 letter word
# score method returns correct score
# word and score are pushed to @wordarray
# test that highest score method calculates correctly
# test that highest score is returned
# test that highest score handles ties


end
