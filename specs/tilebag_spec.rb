require_relative 'spec_helper'

describe "Scrabble::Tilebag" do

  describe "Scrabble::Tilebag#initialize" do

    it "Letters have correct quantities" do
      Scrabble::Tilebag.new.letter_quantity[:A].must_equal 9
      Scrabble::Tilebag.new.letter_quantity[:D].must_equal 4
      Scrabble::Tilebag.new.letter_quantity[:N].must_equal 6
      Scrabble::Tilebag.new.letter_quantity[:Z].must_equal 1
    end

  end

  describe "Scrabble::Tilebag#draw_tiles and draw_letter" do

    before do
      @game = Scrabble::Tilebag.new
      @draw = @game.draw_tiles(5)
    end

    it "Returns an array of letter symbols that's the same length as given argument" do
      @draw.must_be_kind_of Array
      @draw.length.must_equal 5
      @draw.each do | letter |
        letter.must_be_kind_of Symbol
        @game.letter_quantity.must_include letter
      end
    end

    it "Draws all letters so all letters have value of 0" do
      proc{

      all_letters = []

      98.times do
        all_letters << @game.draw_letter
      end

      group = all_letters.sort.group_by {| letter | letter }
      puts group.map { |letter, count | count.length }
      }
    end

  end
end
