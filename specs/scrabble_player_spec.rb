require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
