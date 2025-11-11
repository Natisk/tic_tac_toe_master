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

          case @game.make_move(ask_for_move)
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

      private

      def ask_for_move
        print "\n#{@game.current_player.name} #{@game.current_player.symbol}, " \
              "choose a position #{TicTacToeMaster::Board::FIELD_SIZE}: "
        gets.to_i
      end
    end
  end
end
