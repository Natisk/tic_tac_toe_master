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
          puts draw_board(@game.board)

          case @game.make_move(ask_for_move)
          when :invalid
            puts '❌ Invalid move, try again.'
          when :win
            puts draw_board(@game.board)
            puts "🏆 #{@game.current_player.name} wins!"
            break
          when :draw
            puts draw_board(@game.board)
            puts "🤝 It's a draw!"
            break
          end
        end
        puts "\n👋 Game over!"
      end

      private

      def draw_board(board)
        rows = board.grid.each_slice(3).map do |row|
          "║  #{row[0]}  ║  #{row[1]}  ║  #{row[2]}  ║"
        end

        top    = '╔═════╦═════╦═════╗'
        middle = '╠═════╬═════╬═════╣'
        bottom = '╚═════╩═════╩═════╝'

        [
          top,
          rows[0],
          middle,
          rows[1],
          middle,
          rows[2],
          bottom,
          ''
        ].join("\n")
      end

      def ask_for_move
        print "\n#{@game.current_player.name} #{@game.current_player.symbol}, " \
              "choose a position #{TicTacToeMaster::Board::FIELD_SIZE}: "
        gets.to_i
      end
    end
  end
end
