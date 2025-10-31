# frozen_string_literal: true

module TicTacToeMaster
  # Controls the main game flow
  class Game
    def initialize
      puts '🎮 Welcome to Tic Tac Toe!'
      print 'Enter name for Player 1 (X): '

      @player1 = TicTacToeMaster::Player.new(gets.strip, 'X')

      print 'Enter name for Player 2 (O): '
      @player2 = TicTacToeMaster::Player.new(gets.strip, 'O')

      @board = TicTacToeMaster::Board.new
      @current_player = @player1
    end

    def start
      loop do
        @board.draw
        print "\n#{@current_player.name} #{@current_player.symbol}, choose a position (1-9): "
        move = gets.to_i

        unless @board.place(move, @current_player.symbol)
          puts '❌ Invalid move, try again.'
          next
        end

        if @board.winner?(@current_player.symbol)
          @board.draw
          puts "🏆 #{@current_player.name} wins!"
          break
        elsif @board.full?
          @board.draw
          puts "🤝 It's a draw!"
        else
          switch_player
        end
      end
      puts "\n👋 Game over!"
    rescue Interrupt
      puts "\nGame interrupted. Good bye!"
    end

    private

    def switch_player
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  end
end
