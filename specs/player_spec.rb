require_relative '../lib/player'

describe "Player class" do

  before do
    @player = Scrabble::Player.new('Ada')
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

end

describe "Play method" do

  before do
    @player = Scrabble::Player.new('Ada')
  end

  it "returns false if score > 100" do
    @player.score = 130
    @player.play("cat").must_equal false
end

it "returns word score" do
  @player.score = 10
  @player.play("cat").must_equal 5
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



describe "Total Score" do

  before do
    @player = Scrabble::Player.new('Ada')
  end

 it "total score returns an integer" do
  3.times { @player.play("cat") }
  @player.total_score.must_be_instance_of Integer
 end

 it "total score returns the correct score" do
  3.times { @player.play("cat") }
  @player.total_score.must_equal 15
 end

end

describe "Won" do
  before do
    @player = Scrabble::Player.new('Ada')
    @player.score = 130
  end

  it "Returns true if score is over 100" do
  @player.won?.must_equal true
  end

  it "Returns false if score is not over 100" do
    @player.score = 50
    @player.won?.must_equal false
  end

end

describe "Highest Scoring Word and Word Score" do
end
end
