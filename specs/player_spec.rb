require_relative '../lib/player'
require_relative '../lib/tilebag'

describe "Player class" do

  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)
  end

  it "Makes a Player class" do
    @player.must_be_instance_of Scrabble::Player
  end

  it "Returns a name when name is called" do
    @player.must_respond_to :name
  end

  it "Returns the correct name" do
    @player.name.must_equal 'Ada'
  end

  it "Must be a String" do
    proc {
      Scrabble::Player.new(25)
    }.must_raise ArgumentError
  end

end

describe "Play method" do

  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)
  end

  it "Must be a String" do
    proc {
      @player.play(23)
    }.must_raise ArgumentError
  end

  it "Returns false if score > 100" do
    2.times { @player.play("ZZZZZZZ") }
    @player.play("cat").must_equal false
  end

it "returns word score" do
  @player.play("cat")
  @player.total_score.must_equal 5
end

it "adds a word to @plays" do
  @player.play("dog")
  @player.plays.must_be_instance_of Array
end

it "adds a word to @plays" do
  @player.play("dog")
  @player.plays[-1].must_equal "dog"
end

it "holds multiple elements" do
  3.times { @player.play("dog") }
  @player.plays.length.must_be :> , 1
end
end



describe "Total Score" do

  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)
  end

 it "total score returns an integer" do
  3.times { @player.play("cat") }
  @player.total_score.must_be_instance_of Integer
 end

 it "Raises an error if it is called before a word has been played" do
   proc {
     @player.total_score
   }.must_raise ArgumentError
 end

 it "total score returns the correct score" do
  3.times { @player.play("cat") }
  @player.total_score.must_equal 15
 end

end

describe "Won" do
  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)

  end

  it "Raises an error if no words have been played" do
    proc {
      @player.won?
    }.must_raise ArgumentError
  end

  it "Returns true if score is over 100" do
    2.times { @player.play("ZZZZZZZ") }
    @player.won?.must_equal true
  end

  it "Returns false if score is not over 100" do
    @player.play("fox")
    @player.won?.must_equal false
  end

end

describe "Highest Scoring Word and Word Score" do
  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)
    3.times { @player.play("cat") }
    @player.play("elephant")
  end

  it "Returns a string" do
    @player.highest_scoring_word.must_be_instance_of String
  end

  it "Returns the correct word" do
    @player.highest_scoring_word.must_equal "ELEPHANT"
  end

  it "Highest word score returns an Integer" do
    @player.highest_word_score.must_be_instance_of Integer
  end

  it "Highest word score returns right integer" do
    @player.highest_word_score.must_equal 13
  end

end

describe "initialize player tiles" do
  before do
    @player = Scrabble::Player.new('Ada', Scrabble::TileBag.new)
  end

  it "initializez with a tilebag object" do
    @player.tilebag.must_be_instance_of Scrabble::TileBag
  end

  it "initializes with an array of 7 tiles" do
  end


  it "tiles is an array of letter" do
  end

end
