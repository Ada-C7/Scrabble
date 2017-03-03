require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/score'
require_relative '../lib/letter'
require_relative '../lib/player'
require_relative '../lib/tilebag.rb'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

<<<<<<< HEAD

describe Scrabble::TileBag do

     before do

     @my_tilebag = TileBag.new

     end

     describe "#initialize" do

          it "Is a kind of TileBag" do

                @my_tilebag.must_be_kind_of Scrabble::TileBag

          end
     end

=======
describe "TileBag" do
>>>>>>> 153d91505006de3e4cef8f50398ea0abfcb5ad1d
end
