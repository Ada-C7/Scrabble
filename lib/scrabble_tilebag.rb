require 'simplecov'
SimpleCov.start

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/scrabble_player'
require_relative '../lib/scrabble'

module Scrabble

  class Tilebag
    attr_accessor :player_bag, :bag

    def initialize
      @bag = %w[
        a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i
        i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r
        s s s s t t t t t t u u u u v v w w x y y z
      ]
      @player_bag = []
    end

    def draw_tiles(num)
      num.times do (@player_bag << @bag.delete(@bag.sample))
      end
    end

    def tiles_remaining
      return @bag.length
    end

  end

end
