module Scrabble
  class Scoring
    tiles = {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10
    }


    def self.score(word)

    end

  end
end



    #
    # Create a Scrabble module at the project root.
    # Create a Scrabble::Scoring class which contains some sort of data structure to store the individual letter scores listed below.
    # Create a Spec file which corresponds to your Scrabble::Scoring class. This spec should contain one red test as a starting point (this test can be modified as your get further through the requirements).
    # Be able to execute your one test using rake from the project root.
