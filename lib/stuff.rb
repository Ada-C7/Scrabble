describe "total_score method" do
  it "returns the correct score" do
    ginny = Scrabble::Player.new
    ginny.play("apple")
    ginny.play("apple")
    ginny.total_score.must_equal 18
  end
end

describe "highest_scoring_word" do
  it "returns a string" do
    ginny = Scrabble::Player.new
    ginny.play("apple")
    ginny.play("peaches")
    ginny.highest_scoring_word.must_be_kind_of String
  end
  it "returns the correct value" do
    ginny = Scrabble::Player.new
    ginny.play("apple")
    ginny.play("peaches")
    ginny.highest_scoring_word.must_equal "peaches"
  end
end

describe "highest_word_score" do
  it "returns an integer" do
    ginny = Scrabble::Player.new
    ginny.play("apple")
    ginny.play("peaches")
    ginny.highest_word_score.must_be_kind_of Integer
  end
  it "returns the correct value" do
    ginny = Scrabble::Player.new
    ginny.play("apple")
    ginny.play("peaches")
    ginny.highest_word_score.must_equal 64
  end
end
