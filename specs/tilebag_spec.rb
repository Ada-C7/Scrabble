require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

describe Scrabble::TileBag do
    before do
        @new_tilebag = Scrabble::TileBag.new
    end

    describe 'tilebag#initialize' do
        it 'creates a bag of tiles' do
            @new_tilebag.in_bag.wont_be_empty
        end

        it 'tile bag contains the correct number of tiles' do
            @new_tilebag.in_bag.length.must_equal 98
        end

        it 'tile bag has correct number of individual letters' do
            @new_tilebag.in_bag.find_all { |letter| letter == 'A' }.length.must_equal 9
            @new_tilebag.in_bag.find_all { |letter| letter == 'H' }.length.must_equal 2
            @new_tilebag.in_bag.find_all { |letter| letter == 'T' }.length.must_equal 6
        end
    end

    describe 'tilebag#draw_tiles(num)' do
        it 'removes the correct number of tiles from set' do
            @new_tilebag.draw_tiles(7)
            @new_tilebag.in_bag.length.must_equal 91
        end

        it 'removes the correct letters from the set' do
            other_tilebag = Scrabble::TileBag.new
            first_tilebag = other_tilebag.in_bag
            @new_tilebag.draw_tiles(3)
            second_tilebag = @new_tilebag.in_bag

            two = second_tilebag.find_all { |letter| @new_tilebag.tiles_drawn.include? letter }
            one = first_tilebag.find_all { |letter| @new_tilebag.tiles_drawn.include? letter }

            @new_tilebag.tiles_drawn.each do |letter|
                two[letter].count.wont_equal one[letter].count
            end
        end

        it 'raises an error if user tries to draw more tiles than available' do
            proc { @new_tilebag.draw_tiles(99) }.must_raise ArgumentError
        end
    end

    describe 'tilebag#tiles_remaining' do
        it 'returns an Integer' do
            @new_tilebag.tiles_remaining.must_be_instance_of Integer
        end

        it 'returns correct number of tiles' do
            @new_tilebag.tiles_remaining.must_equal 98
            @new_tilebag.draw_tiles(8)
            @new_tilebag.tiles_remaining.must_equal 90
        end

        it 'throws a message when 0 tiles' do
            @new_tilebag.draw_tiles(98)
            proc { @new_tilebag.tiles_remaining }.must_output /.+/
        end
    end
end
