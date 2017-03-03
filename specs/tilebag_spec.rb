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
