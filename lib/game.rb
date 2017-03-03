module Scrabble
  class Game
    attr_accessor :current_turn
    attr_reader :active_player, :inactive_player

    def initialize(player1_name, player2_name)
      @player_1 = Player.new(player1_name)
      @player_2 = Player.new(player2_name)
      @active_player, @inactive_player = @player_1, @player_2
      @current_turn = {}
      @turns_taken = 0

      @board = Board.new
      @tilebag = TileBag.new
    end

    def play
      @board.display

      until @player_1.won? || @player_2.won?
        @active_player.draw_tiles(@tilebag)

        puts "#{@active_player.name}, which word would you like to play?"
        puts "(Type '$quit' to quit.)"
        puts "Available Letters: #{@active_player.tiles.join(", ")}"
        until @current_turn[:valid]
          get_turn
        end

        @active_player.play(@current_turn[:word])
        @active_player.remove_tiles(@current_turn[:tiles_used])
        @board.place_word(@current_turn)
        @turns_taken += 1

        @board.display
        puts "#{@active_player.name} Score: #{@active_player.total_score}"
        puts
        check_for_win
        switch_players
        @current_turn = {}
      end
    end

    def switch_players
      @active_player, @inactive_player = @inactive_player, @active_player
    end

    def get_turn
      @current_turn = {}
      print "Word      > "
      @current_turn[:word] = gets.chomp.upcase
      quit if @current_turn[:word] == "$QUIT"
      print "Column    > "
      @current_turn[:column] = gets.chomp.to_i
      print "Row       > "
      @current_turn[:row] = gets.chomp.to_i
      print "Direction > "
      @current_turn[:direction] = gets.chomp

      if valid_placement? && valid_tiles? && Dictionary.valid_word?(@current_turn[:word])
        @current_turn[:valid] = true
      end
    end

    def reset_turn
      @current_turn = {}
    end

    def valid_placement?
      if !(1..15).include?(@current_turn[:row]) || !(1..15).include?(@current_turn[:column])
        puts "Row and column number must be between 1 and 15."
        false
      elsif !@board.space_available?(@current_turn)
        puts "Space unavailable."
        false
      else
        true
      end
    end

    def valid_tiles?
      @current_turn[:tiles_used] = @board.tiles_needed(@current_turn)

      # Checks to see if the player has the right tiles for the move
      available = @active_player.tiles.dup
      @current_turn[:tiles_used].each do |letter|
        if available.include?(letter)
          available.delete_at(available.index(letter))
        else
          puts "You do not have the tiles for this move."
          return false
        end
      end

      # Checks to make sure the move connects to existing words on the board,
      # unless it is the first turn
      if @current_turn[:tiles_used].length == @current_turn[:word].length && @turns_taken != 0
        puts "You must connect to a word on the board."
        return false
      end

      true
    end

    def check_for_win
      if @player_1.won? || @player_2.won?
        winner = @player_1.won? ? @player_1.name : @player_2.name
        puts "#{winner} wins! Horray!"
      end
    end

    def quit
      puts "\nFinal Scores:"
      puts "#{@player_1.name}: #{@player_1.total_score}"
      puts "#{@player_2.name}: #{@player_2.total_score}"

      winner = @player_1.total_score > @player_2.total_score ? @player_1.name : @player_2.name
      puts "#{winner} wins! Horray!"
      exit
    end

  end
end
