# frozen_string_literal: true

module TicTacToeMaster
  # Controls the main game flow
  class Game
    attr_reader :player1, :player2, :current_player, :board

    WIN_CONBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].freeze

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
      return :invalid unless board.place(position, current_player.symbol)

      if winner?(current_player.symbol)
        :win
      elsif board.full?
        :draw
      else
        switch_player
        :next_turn
      end
    end

    def winner?(symbol)
      WIN_CONBINATIONS.any? do |combo|
        combo.all? { |index| board.grid[index] == symbol }
      end
    end

    private

    def switch_player
      @current_player = current_player == player1 ? player2 : player1
    end
  end
end
