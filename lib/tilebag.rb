require_relative './player'

module Scrabble
    class TileBag < Player
        TILEBAG = {
            0=>[],
            1 => %w(J K Q X Z),
            2 => %w(B C F H M P V W Y),
            3 => %w(G),
            4 => %w(D L U S),
            6 => %w(N R T),
            8 => %w(O),
            9 => %w(A I),
            12 => %w(E)
        }

        def initialize
            @tilebag = TILEBAG
            @drawn_tiles = []
        end

        def draw_tiles(num)
            until @drawn_tiles.length == num
                @letters = ('A'..'Z').to_a.sample
                @tilebag.each do |amt, letters|
                    next unless letters.any? { |_letter| @letters }
                    @tilebag[amt].delete_if { |letter| letter == @letters }
                    @tilebag[amt - 1] += letters.select! { |letter| letter == @letters }
                    @drawn_tiles << @letters
                end
            end

            # @temp_bag = @tilebag.values.group_by do |letters|
            #     letters.each do |letter|
            #         if @drawn_tiles.include? letter
            #             @tilebag[letter] - 1
            #         else
            #             @tilebag[letter]
            #         end
            #     end
            # end

            print @tilebag
            print @drawn_tiles
        end
    end
end

test = Scrabble::TileBag.new

test.draw_tiles(7)
