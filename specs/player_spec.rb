require_relative '../lib/player'

describe "Wave 2" do

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
