# frozen_string_literal: true

module TicTacToeMaster
  # Controls the main game flow
  class Game
    attr_reader :player1, :player2, :game, :current_player

    def initialize(player1_name:, player2_name:)
      @player1 = Player.new(player1_name, 'X')
      @player2 = Player.new(player2_name, 'O')
      @board = Board.new
      @current_player = @player_1
    end

    # returns :invalid, :win, :draw or :next_turn
    def make_move(position)
      return :invalid unless board.place(position, current_player.symbol)

      if board.winner?(current_player.symbol)
        :win
      elsif board.full?
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
