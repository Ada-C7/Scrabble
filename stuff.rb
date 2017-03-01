describe "total_score method" do
  it "returns the correct score" do
          Scrabble::Scoring.score("apple").must_equal 9
      Scrabble::Player.total_score.must_equal 18
  end
end
