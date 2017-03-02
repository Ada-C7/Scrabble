require_relative '../lib/tilebag'

describe "Tile Bag class" do

  describe "Initialize" do

    before do
        @ourtiles = Scrabble::TileBag.new
      end

    it "Initializes with a hash" do
      @ourtiles.tiles.must_be_instance_of Hash
    end

    it "Has the correct keys" do
        @ourtiles.tiles.keys.each do |key|
          key.must_be_instance_of String
        end
    end

    it "Has the correct value" do
        @ourtiles.tiles["B"].must_equal 2
        @ourtiles.tiles["P"].must_equal 2
        @ourtiles.tiles["S"].must_equal 4
        @ourtiles.tiles["Z"].must_equal 1

      #pick keys at random and check value
    end

  end

  describe "Draw Tiles" do

    it "Returns a collection of letters" do
    end

    it "Decrements letter amount from tile bag" do
    end

    it "Does not allow a letter to be drawn if the value is 0" do
    end

    it "Requires a number" do
    end

    it "Requires a positive number" do
    end

    it "Requires a number between 0 and 7" do
    end

  end

  describe "Tiles Remaining" do

    it "Returns an Integer" do
    end

    it "Returns the correct integer" do
    end
  end


end
