require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/letter'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe Scrabble::Letter do

     before do

          @my_letter = Scrabble::Letter.new("l")
     end


     it "Takes a letter" do

          @my_letter.must_respond_to :name
          @my_letter.name.must_equal "L"

     end

     it "Is a kind of Letter" do

          @my_letter.must_be_kind_of Scrabble::Letter

     end

     it "Assigns the correct points to letter" do

          @my_letter.point.must_equal 1

     end

     # it "Ensures argument is a letter." do
     #
     #      proc {Scrabble::Letter.new(0)
     #      }.must_raise ArgumentError
     #
     # end

end
