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
end

describe "Total Score" do
end

describe "Won" do
end

describe "Highest Scoring Word and Word Score" do
end
