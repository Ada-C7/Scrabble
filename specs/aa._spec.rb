require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'
Minitest::Reporters.use!


#When we run simplecov for a misterius reason
#the first file in specs was not showing. That is why
#we came with this temporary solution, just to make
#sure that we hit %100 coverage :)
