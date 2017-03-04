require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'
require_relative '../lib/scoring'
require_relative '../lib/tilebag'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
