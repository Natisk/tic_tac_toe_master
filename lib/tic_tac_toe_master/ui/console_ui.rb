# frozen_string_literal: true

module TicTacToeMaster
  module UI
    # Console interface display option
    class ConsoleUI
      def initialize(game)
        @game = game
      end

      def start
        puts '🎮 Welcome to Tic Tac Toe!'

        loop do
          @game.board.draw
          print "\n#{@game.current_player.name} #{@game.current_player.symbol}, choose a position (1-9): "
          move = gets.to_i

          case @game.make_move(move)
          when :invalid
            puts '❌ Invalid move, try again.'
          when :win
            @game.board.draw
            puts "🏆 #{@game.current_player.name} wins!"
            break
          when :draw
            @game.board.draw
            puts "🤝 It's a draw!"
            break
          end
        end
        puts "\n👋 Game over!"
      end
    end
  end
end
