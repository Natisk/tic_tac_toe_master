# frozen_string_literal: true

require 'forwardable'

module TicTacToeMaster
  # Controls the main game flow
  class Game
    extend Forwardable

    def_delegators :@board, :place, :winner?, :full?

    attr_reader :player1, :player2, :current_player, :board

    def initialize(player1_name:, player2_name:)
      @player1 = TicTacToeMaster::Player.new(player1_name, 'X')
      @player2 = TicTacToeMaster::Player.new(player2_name, 'O')
      @board = TicTacToeMaster::Board.new
      @current_player = @player1
    end

    # Makes a move for the current player at the given position.
    # Returns:
    # :invalid  - if the move is invalid
    # :win      - if the current player wins
    # :draw     - if the board is full (draw)
    # :next_turn - if the game should continue
    def make_move(position)
      return :invalid unless place(position, current_player.symbol)

      if winner?(current_player.symbol)
        :win
      elsif full?
        :draw
      else
        switch_player
        :next_turn
      end
    end

    private

    def switch_player
      @current_player = current_player == player1 ? player2 : player1
    end
  end
end
