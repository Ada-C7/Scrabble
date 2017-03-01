require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

describe 'tilebag#initialize' do
    it 'creates a bag of tiles' do
    end
end

describe 'tilebag#draw_tiles(num)' do
  it 'removes the correct number of tiles from set' do
  end
  it 'removes the correct letters from the set' do
  end
end

describe 'tilebag#tiles_remaining' do
  it 'returns an Integer' do
  end
  it 'returns correct number of tiles' do
  end
  it 'throws a message when 0 tiles' do
  end
end
